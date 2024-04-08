Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C459957900
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHp1YWtz3fln
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L2deLbk2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtsq4KbPz3dSL
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:19 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so4632691e87.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591595; x=1713196395; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZNPSolpsyW2BBt4Cv9G0c69Pzyf7OGHTEy9xs9+O7A=;
        b=L2deLbk2a1YeMXSuU/3SFun0mm1pRDK9I/wlhufhHw1RDV5YZ5uyst80DYT4FoMerp
         RZ5kQzNapJTBRol1IoKAz2dgKMWGGhS5XSUgYlAKIS4N2P4D+cUy9GG+ospiHlhVH3Ta
         bM99SWcIb6sFbawz0ZvaBldrZe+l0Z7sHw8YLil37YNBcjA81BBhNfrkkBbMWtg5F6bn
         WGXBdsyoJmnDhOaH0UqVPlqy3c5z/y5jI0fu3qPDnPLF9erG5j//3Ok25raZNmXml4of
         VFlB2y/fVsb/c007TCsptS6rC74//yegGdgaHBM9YkjtYp3RSJybIeS86CZeQRxPLdxN
         6KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591595; x=1713196395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZNPSolpsyW2BBt4Cv9G0c69Pzyf7OGHTEy9xs9+O7A=;
        b=RIgdtWVHhEUDGI+hpMGDzrEwTnGkIhnNngpG+boF+h3lVbX69qEEcKgoW6SBShbF5L
         FeKRe8b3rDxIlx2gLrjF1PqlkxZksruBv3ZSGylFG1DSaItNcdnhVNNIdtYIUB3xo9rv
         ZkPLx0YbI2XLtrE3fntlr28N1qjY0I64lEWz5LTS4Mdc/SZjdbnoQnGeWyyJFBSiiFjP
         AgX4vNOvKHPvhNOBpdIdNOizNwD8bi8bWBNs13129TB55XghG7XDm64zvTmJ5c0tbLH8
         GPmp8AW5Vz90O/JYEf8M5L6XX07/xwGHJwrFFqiy/6FEv/zF9335jYkUfXPUKRU13ezp
         jETw==
X-Forwarded-Encrypted: i=1; AJvYcCVbsWexPEfXFNgt/dOH3NrNY0VInHWtyADwV0vYAsNw7p6DdarnDXahQBP3dGS6Qo3RBZRV8e8zy6wC3LVZwoSUVmD2FLCy3/5ipOjaIg==
X-Gm-Message-State: AOJu0YwH1kp1rjk5eEUsUyECwcfTudsHjk8ncNd4ze8/3T6IektC5zRG
	cvohCN+IXwWQIgxgsubbVzdFNLqpYdcceKF+EhVQKjV08JApZ3r+
X-Google-Smtp-Source: AGHT+IHHjnlpbYGoVoRBTjaLp6Pq3A5BQFRFuLX80oSlH+nvQTdtLncSAg4Fv6oSY2gm4yEe75RZ0g==
X-Received: by 2002:ac2:5f1c:0:b0:516:ce06:ac8e with SMTP id 28-20020ac25f1c000000b00516ce06ac8emr5820717lfq.51.1712591595088;
        Mon, 08 Apr 2024 08:53:15 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:14 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:03 +0200
Subject: [PATCH 3/9] dt-bindings: rtc: lpc32xx-rtc: move to trivial-rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-3-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1653;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=oXF0IOpDbbU06OjI6OgtSVdRvz0EfEWAr+7KUKC2fPo=;
 b=cXwmCtklzwmwm52UDPVuk6WWDHgL1i0zzCtfIEhsTmu1EI8lNZwtM2+GXUd9vnJCrPPqUZ8mZ
 dM7tV4/p9z9AnwXdlchsL+guM1nOVq79TSHnwxlzcL0CuAAe0Fn8NP7
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

This RTC requires a compatible, a reg and a single interrupt,
which makes it suitable for a direct conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt  | 15 ---------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt b/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
deleted file mode 100644
index a87a1e9bc060..000000000000
--- a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* NXP LPC32xx SoC Real Time Clock controller
-
-Required properties:
-- compatible: must be "nxp,lpc3220-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The RTC interrupt
-
-Example:
-
-	rtc@40024000 {
-		compatible = "nxp,lpc3220-rtc";
-		reg = <0x40024000 0x1000>;
-		interrupts = <52 0>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index b889b9317a41..d6ce7ac29033 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -55,6 +55,8 @@ properties:
       - microcrystal,rv3029
       # Real Time Clock
       - microcrystal,rv8523
+      # NXP LPC32xx SoC Real-time Clock
+      - nxp,lpc3220-rtc
       # Real-time Clock Module
       - pericom,pt7c4338
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC

-- 
2.40.1

