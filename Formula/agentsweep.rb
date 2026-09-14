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
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.0/agentsweep-aarch64-apple-darwin"
      sha256 "6ba22bbbe64fe2a30033dd5d90fa04f253f6d9acbb3c09068384981ac73616a8"
    else
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.0/agentsweep-x86_64-apple-darwin"
      sha256 "a0b2dcd03eced28aa6016c211c0daa862b2b0650fcdc87bef29520ccef42ccb9"
    end
  end

  on_linux do
    url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.0/agentsweep-x86_64-unknown-linux-gnu"
    sha256 "334f0fffde7c25576c12990b37d77ad30e983f281c525fde5bb678d91b8a0732"
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
