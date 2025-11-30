class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.32/aarch64-apple-darwin.tar.gz"
      sha256 "ded5e9903312c6b4466e0ba1c2860d7011e66294971b34231f195c5b8c48a566"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.32/x86_64-apple-darwin.tar.gz"
      sha256 "c0d175e52fd57e2a5914e2a64220e3dbc8855584a20085fe98b5a83363bd905b"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.32/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "076bb2be0ea51354bbba4ed8dc2843f562f8c23657a2e57694297502f012f76d"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
