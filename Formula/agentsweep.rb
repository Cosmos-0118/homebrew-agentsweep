# Homebrew formula for AgentSweep.
# This is the source of truth: .github/workflows/release.yml regenerates
# version/url/sha256 on every v* tag (via scripts/update_homebrew_sha.py),
# commits the result here, and syncs a copy to Formula/agentsweep.rb in the
# Cosmos-0118/homebrew-agentsweep tap repo.
# Install with:
#   brew tap Cosmos-0118/agentsweep
#   brew install agentsweep
class Agentsweep < Formula
  desc "Understand and control what your coding agents store locally"
  homepage "https://github.com/Cosmos-0118/AgentSweep"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.1.0/agentsweep-aarch64-apple-darwin"
      sha256 "0e9f9d4e78fffb4c5c3a179aa625acf9ad10d996f36440ae3e85f9a1bcf07add"
    else
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.1.0/agentsweep-x86_64-apple-darwin"
      sha256 "e0ac2e6789be839c0208de4c5795d8c750f184941c89d4e1ef6e9ba716ddd514"
    end
  end

  on_linux do
    url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.1.0/agentsweep-x86_64-unknown-linux-gnu"
    sha256 "97d44e16269148e5e872ca405dccebfcf730f7d3f8706f69381013b22b190503"
  end

  def install
    bin.install "agentsweep-aarch64-apple-darwin" => "agentsweep" if OS.mac? && Hardware::CPU.arm?
    bin.install "agentsweep-x86_64-apple-darwin" => "agentsweep" if OS.mac? && Hardware::CPU.intel?
    bin.install "agentsweep-x86_64-unknown-linux-gnu" => "agentsweep" if OS.linux?
  end

  test do
    assert_match "agentsweep", shell_output("#{bin}/agentsweep --version")
  end
end
