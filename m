Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C20279E61
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 03:53:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yKNM1BrvzDqS3
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 11:53:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::74a;
 helo=mail-qk1-x74a.google.com;
 envelope-from=3xqi_xqmkdje9d519916z.x97638fi-vdazzy63ded.9k6vwd.9c1@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="obSxPLVX"; 
 dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yKJR4H6ZzDqRH
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 11:50:25 +1000 (AEST)
Received: by mail-qk1-x74a.google.com with SMTP id t196so53680200qke.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 18:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XhtnPgPdJLEODnhelBCfXYYebt+drQqz99ntQ+W4VXY=;
 b=obSxPLVX6W8OAtWYiuurB+F7hjGZnwAQ73mHfChT2pafrLmMr2sNq1aGn7aqqIxwjH
 qeE8ijz2I6mHIDhPtDwqVfVKYbt4PULCn1liLpvNQE4RQbMFhrNYZcZ4RQAaXl/8gDjn
 anCmoIh/RIE55UkTF0Qo6ipqMn9tGffySD9lnKCwMjT2hw32GFsuNY29N9NzvqONiVnR
 H6PiLZcBg9ayWI7L9JSJ8wTvFAhd/5pwK+Ev2TsCcJA5LjYFBM7l0V9bM90kIfRzGejN
 0OFvAyqB5ZX5TeMrhzs+CyrAURHqPey/4zb8cdExh64cOQ+IR4EVpI6P4clnZ7bWeXUx
 9BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XhtnPgPdJLEODnhelBCfXYYebt+drQqz99ntQ+W4VXY=;
 b=r/ibc4htTjz2pw7/lzAS+bZ7XzVjn5Su1j0TEga2H2ET+ETLYGbyRUldS2MMHL5f0f
 ZIXHwJePx3G298XqppH9+UfIAHkie5Cg7iH8k8ndBr3PRbbYSJNS35FfeYfWwtDrEBVk
 xFgdZTOKXJrzEhHYnDK58tyjvjiCRG3Do2zRq31m8cnkXBboo6wre9k+WbT0SNLqtXdf
 CwWGZvP9N2MgguGr9KfimjVZfzp3AvCfOmj77PZH9mHEzzV/2fAsD0OYHjkYNRf8P0Wp
 bpAITyYcD0STTn/B938IJXZVsJoMi0WqUc+ENcEeF6Wjccr+LaHckN+0VG5S9NgEF7kO
 Vgxw==
X-Gm-Message-State: APjAAAWUADIr/9C2EH1atAjaGY5rwEGkJIf6JTzCqQvmFexvdrHHr4JF
 ck5+NZUfkSECrJxKCgtnXrvhc7o=
X-Google-Smtp-Source: APXvYqxgvr9rQU4bepJKvgC4/F+pqbpBd++0qokNvxjficvCtUEw5GJEq/TFR3/KjOlNBjt2zcz3Prs=
X-Received: by 2002:ac8:2f43:: with SMTP id k3mr80932816qta.179.1564451422658; 
 Mon, 29 Jul 2019 18:50:22 -0700 (PDT)
Date: Mon, 29 Jul 2019 21:49:54 -0400
In-Reply-To: <20190730014955.34059-1-osk@google.com>
Message-Id: <20190730014955.34059-2-osk@google.com>
Mime-Version: 1.0
References: <20190730014955.34059-1-osk@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v2 2/3] dt-bindings: misc: Bindings doc for aspeed-uart-routing
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org, Oskar Senft <osk@google.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Device tree bindings documentation for the aspeed-uart-routing driver.

Signed-off-by: Oskar Senft <osk@google.com>
---
Changes since v1:
 Split out bindings documentation from driver commit.
 Added bindings for AST2400.

 .../bindings/misc/aspeed-uart-routing.txt     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-uart-routing.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed-uart-routing.txt b/Documentation/devicetree/bindings/misc/aspeed-uart-routing.txt
new file mode 100644
index 000000000000..bb9ce689d56b
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed-uart-routing.txt
@@ -0,0 +1,39 @@
+======================================================================
+Device tree bindings for Aspeed AST2400/AST2500 UART Routing Control Driver
+======================================================================
+
+The Aspeed AST2500 allows to dynamically route the inputs for the built-in
+UARTS and physical serial I/O ports.
+
+Required properties:
+===================
+
+ - compatible: must be one of:
+	- "aspeed,ast2400-uart-routing"
+	- "aspeed,ast2500-uart-routing"
+
+Optional properties:
+===================
+
+The uart-routing node should be the child of a lpc node with the required
+property:
+
+- compatible : Should be one of the following:
+		"aspeed,ast2400-lpc", "simple-mfd"
+		"aspeed,ast2500-lpc", "simple-mfd"
+
+Example
+===================
+
+g5 Example
+----------
+
+lpc: lpc@1e789000 {
+	compatible = "aspeed,ast2500-lpc", "simple-mfd";
+	reg = <0x1e789000 0x1000>;
+
+	uart_routing: uart_routing@9c {
+		compatible = "aspeed,ast2500-uart-routing";
+		reg = <0x9c 0x4>;
+	};
+};
-- 
2.22.0.709.g102302147b-goog

