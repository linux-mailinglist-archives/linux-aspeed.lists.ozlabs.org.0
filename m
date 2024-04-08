Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC899957909
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHq6w46z3c6n
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S0KeDLTX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtt33vmZz3dLQ
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:31 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a450bedffdfso653740666b.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591608; x=1713196408; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Y7DfeV8VLm+4dkW5onFx6zdkwwBWr0ksWuO3GWgBgU=;
        b=S0KeDLTXabfGdthAff5eKVwzQGZognTBb8CdWafSw+CVsrvwkvi4KskgOxJ4GW8zCq
         lX7VvDtaBqknjWbugc5wrn2ruG4NTLaG8Uq6PDYVirK3DQMLR0Fw4mHE2kIzmiQ/Lxkp
         Ora69f1wAoe7yerBcHnghyTxN4GRnghYkuJ167ydrNztQD5VRyauP1AV3x236MDJ9hHS
         f4BUfRAiq73U5cvuBwMAAjCg6w0Dx/gmmgY5KNpJC54FM04ioMhKBSpA4XbGm0q9E9aP
         q0OGL/wkauMvODdpVqaVanOizIclToAkKexYRVRykn/faz6VKe3nAx17rmbsFLbgiJvc
         Xglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591608; x=1713196408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Y7DfeV8VLm+4dkW5onFx6zdkwwBWr0ksWuO3GWgBgU=;
        b=hCAVepvvj3oVe+2IX4pvd1tzD7FJf7QwJ66djwg8j0HHgJVIuOCoQrkMkn7+kCpO6R
         cOw0ZfInzlNmKImTQK6vYlRxsLVxs8JgHMBlN2Uw7Q/aLc3mzLrEpUU9FybvOl/dFUdT
         GiHyrz0V5i89mDSNv+jx4AV0YqWlAPfT/qOD8ZBHugIxj+Vv/3mnn/i0ROYYAv3Un8yS
         Pjq6x9Fa+Vgi0FtWUvg7SFmbiCkVxFwE37BpTvdaNh373ju3500g/cs7Vf0jEBa/grQo
         94sH4kFbe1B8iuewK6QJaD27j5kwd1KasRrCkhHWWchalqa3SiEq4TZOIbJ7njQVKQwJ
         SNxw==
X-Forwarded-Encrypted: i=1; AJvYcCWvTwC1ycqPGXLbyOR6ifGsvAoxEBG8eCbh1j0x/peagDxEsfPOHLa9KLYw7sq8S8CjQxpoPC1nDAGi+Ed3QbnIDDvdDNQEM05eLas/HQ==
X-Gm-Message-State: AOJu0YyTU8bgc0X/QXKF7fv2T9YuvXapdTlPcf16MOOUOG1WiJh0sPjP
	23pdQK4IQKQtgUvYxM7SAS8trlb/0fTp0gVaKNWHS9r1wr9fMkUk
X-Google-Smtp-Source: AGHT+IGdfX/y51Nks6qsHsv5sXslTDtqdDAyN1/b0esXW0O17PcNWR7tUFhV60oXtdma+8MhUzqNbQ==
X-Received: by 2002:a17:907:3da8:b0:a51:dc1f:a44b with SMTP id he40-20020a1709073da800b00a51dc1fa44bmr1941414ejc.29.1712591607822;
        Mon, 08 Apr 2024 08:53:27 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:08 +0200
Subject: [PATCH 8/9] dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-8-c447542fc362@gmail.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
In-Reply-To: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=2964;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=AIsscuJi094OEVGSsAf9Wlesp0w/0ZWJH8OIPmC6tCw=;
 b=SjxANSNsLql56s4aBhO5sITwOL73aDDWw1tzYNIUF/EDIaC42lzFW9WBN+FJIfBZhJZSJUWG5
 L8HyqJln2diCnF1A3y5vZJJOTZpEnbK/pWIrvAK7sqt7PRQjR8fDhvQ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert existing binding to dtschema to support validation.

The 'fsl,imx28-rtc' compatible is currently not supported, and it is
only referenced in this binding and in nxp/mxs/imx28.dtsi. Therefore,
that compatible has been dropped, which triggers a warning when testing
the DT against the new binding.

There is another reference to fsl,stmp3xxx-rtc in nxp/mxs/imx23.dtsi,
where another unsupported compatible 'fsl,imx23-rtc' is used, and the
same problem would arise when testing the file against the new binding.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 45 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ----------
 2 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
new file mode 100644
index 000000000000..bf70cce2701f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/fsl,stmp3xxx-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMP3xxx/i.MX28 Time Clock Controller
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: fsl,stmp3xxx-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  stmp,crystal-freq:
+    description:
+      Override crystal frequency as determined from fuse bits.
+      Use <0> for "no crystal".
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 32000, 32768]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    rtc@80056000 {
+        compatible = "fsl,stmp3xxx-rtc";
+        reg = <0x80056000 2000>;
+        interrupts = <29>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt b/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
deleted file mode 100644
index fa6a94226669..000000000000
--- a/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-* STMP3xxx/i.MX28 Time Clock controller
-
-Required properties:
-- compatible: should be one of the following.
-    * "fsl,stmp3xxx-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: rtc alarm interrupt
-
-Optional properties:
-- stmp,crystal-freq: override crystal frequency as determined from fuse bits.
-  Only <32000> and <32768> are possible for the hardware.  Use <0> for
-  "no crystal".
-
-Example:
-
-rtc@80056000 {
-	compatible = "fsl,imx28-rtc", "fsl,stmp3xxx-rtc";
-	reg = <0x80056000 2000>;
-	interrupts = <29>;
-};

-- 
2.40.1

