Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF4143513
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jan 2020 02:15:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481rFC1XgFzDqXt
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jan 2020 12:15:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=neuralgames.com
 (client-ip=69.13.37.146; helo=kross2019.rwserver.com;
 envelope-from=linux@neuralgames.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=neuralgames.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=neuralgames.com header.i=@neuralgames.com
 header.a=rsa-sha256 header.s=default header.b=kY+GPOBB; 
 dkim-atps=neutral
Received: from kross2019.rwserver.com (kross.rwserver.com [69.13.37.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481Zrk1V3JzDqSD
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jan 2020 02:11:48 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by kross2019.rwserver.com (Postfix) with ESMTP id 3E1EBB3629;
 Mon, 20 Jan 2020 09:01:33 -0600 (CST)
Authentication-Results: kross2019.rwserver.com (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=neuralgames.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuralgames.com;
 h=x-mailer:message-id:date:date:subject:subject:from:from; s=
 default; t=1579532490; x=1581346891; bh=dshgkKumJVS0zAqIIrcV+cw7
 enEW8iyIBXeKU3OU9w4=; b=kY+GPOBBbjAO2SEjaQm70ehoBqYzhl9zuqJcDvf9
 rZjYn0c8QmwPVNoZ13ejhQEWEEnhy4Kh5ot8OLH+v4A4uxbzILR/GUZ+2SXAfMJp
 Ie2Jt9n13YD3PsTv8s1wVAI0BzbzOf1+onms+kCrTQTe3ti050chJ2HoYxhOJn6F
 Yyg=
X-Virus-Scanned: Debian amavisd-new at kross2019.rwserver.com
Received: from kross2019.rwserver.com ([127.0.0.1])
 by localhost (kross2019.rwserver.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5l7g2zoo_9du; Mon, 20 Jan 2020 09:01:30 -0600 (CST)
Received: from localhost (ZT-GROUP-IN.bear1.Houston1.Level3.net [4.14.58.158])
 (Authenticated sender: linux@neuralgames.com)
 by kross2019.rwserver.com (Postfix) with ESMTPSA id 9F147B3628;
 Mon, 20 Jan 2020 09:01:30 -0600 (CST)
From: Oscar A Perez <linux@neuralgames.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Oscar A Perez <linux@neuralgames.com>, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwrng: Add support for ASPEED RNG
Date: Mon, 20 Jan 2020 15:01:08 +0000
Message-Id: <20200120150113.2565-1-linux@neuralgames.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 21 Jan 2020 12:15:20 +1100
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This minimal driver adds support for the Hardware Random Number Generator
that comes with the AST2400/AST2500/AST2600 SOCs from AspeedTech.

The HRNG on these SOCs uses Ring Oscillators working together to generate
a stream of random bits that can be read by the platform via a 32bit data
register.

Signed-off-by: Oscar A Perez <linux@neuralgames.com>
---
 .../devicetree/bindings/rng/aspeed-rng.yaml   | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/aspeed-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/aspeed-rng.yaml b/Documentation/devicetree/bindings/rng/aspeed-rng.yaml
new file mode 100644
index 000000000000..06070ebe1c33
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/aspeed-rng.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/aspeed-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+
+title: Bindings for Aspeed Hardware Random Number Generator
+
+
+maintainers:
+  - Oscar A Perez <linux@neuralgames.com>
+
+
+description: |
+  The HRNG on the AST2400/AST2500/AST2600 SOCs from AspeedTech  uses four Ring
+  Oscillators working together to generate a stream of random bits that can be
+  read by the platform via a 32bit data register every one microsecond.
+  All the platform has to do is to provide to the driver the 'quality' entropy
+  value, the  'mode' in which the combining  ROs will generate the  stream  of
+  random bits and, the 'period' value that is used as a wait-time between reads
+  from the 32bit data register.
+
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - aspeed,ast2400-rng
+              - aspeed,ast2500-rng
+              - aspeed,ast2600-rng
+
+
+  reg:
+    description:
+      Base address and length of the register set of this block.
+      Currently 'reg' must be eight bytes wide and 32-bit aligned.
+
+    maxItems: 1
+
+
+  period:
+    description:
+      Wait time in microseconds to be used between reads.
+      The RNG on these Aspeed SOCs generates 32bit of random data
+      every one microsecond. Choose between 1 and n microseconds.
+
+    maxItems: 1
+
+
+  mode:
+    description:
+      One of the eight modes in which the four internal ROs (Ring
+      Oscillators)  are combined to generate a stream  of random
+      bits. The default mode is seven which is the default method
+      of combining RO random bits on these Aspeed SOCs.
+
+    maxItems: 1
+
+
+  quality:
+    description:
+      Estimated number of bits of entropy per 1024 bits read from
+      the RNG.  Note that the default quality is zero which stops
+      this HRNG from automatically filling the kernel's entropy
+      pool with data.
+
+    maxItems: 1
+
+
+required:
+  - compatible
+  - reg
+  - period
+  - quality
+
+
+examples:
+  - |
+    rng: hwrng@1e6e2074 {
+         compatible = "aspeed,ast2500-rng";
+         reg = <0x1e6e2074 0x8>;
+         period = <4>;
+         quality = <128>;
+         mode = <0x7>;
+    };
+
+
+...
-- 
2.17.1

