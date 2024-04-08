Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE5D957908
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHq5Nmjz3ft1
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ixfKs2gN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtsy3ZTgz3dTG
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:26 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a51ddc783e3so120949066b.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591603; x=1713196403; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWg1ENlXHc+/PDZHBiKvXmfM9dCYHYF/K16ZOemXbZc=;
        b=ixfKs2gN07FMQEqUBatlJVNOoHGAt0uSJx0jRa6jqQdd/bjoDHVF2oix6bmPYnsHdW
         k358FVp8GiOCDBmzMeF5SNe6IR9wMjgcCkWL+OXi9IpSIbsbB5vwlqTHuxffPHSrHK9p
         d9tMwPGQMZeR3l5AqdbKAjZZYCu0oaSstbFY+OnABqVdBUxPJ23QuoxgVZK9RTfiCntu
         QnU/do5DYjPlFD1dLMlSWBwMTJRedZihB/Xyq4VkUJJ9DY+TS1fg5y2nR0gyT/bnh8Mo
         VYGMNSrbVu3eL/pAgNpYt52jlGcWyUUnhudYqtoPi8h5idNxj3ZPJDDHJ/ECBiFu7WPc
         DJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591603; x=1713196403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWg1ENlXHc+/PDZHBiKvXmfM9dCYHYF/K16ZOemXbZc=;
        b=PUkLrQRb008aXUhGcC7I8yVGl/DYRYEGLf5qWgT/KlhhJLMYkQStJTbfJsu1tfnMBR
         NzpaELpbV2uMG6kdWwt72xCgIErDhz6uJDAVq1C8MDtjGBYPyG58x5v4VMeg2X2EIX9N
         Zcn9dR28Q4VxoA3D0u0WJQc53q0Z9jsEm6H1k8ctjc070MfEm9OM+mdquXp4nPyzGufr
         G3fwpxWrtiq4u7SOH7Z/CGXoS/Ex+JvuCCeTBzSAPQuBXiXIJD9ZQjSxWlThNejutr21
         1ILPKVf11ODm8vppPGYR2+GtYKY2my2Ks0el1BuuFj8fsiyBcubvEh3EtAlvuoBQceZ2
         1yGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK04VJQH7LGy+oKb/YJW4bi1nT4egLW1uTC0zVXi3WiOJvvWxYFODf4pueDYaJPJFdtxZOcqzxoPviv/41Fkog5ZouvkexBizlIdaokw==
X-Gm-Message-State: AOJu0Yz38M0MO4O2exn4QrMv6L2j8cFIoyQgVVMMP4P2F4uuyh3H8puV
	QOzyblpr0/uD0oX+3IRjjhfmw+ORYiEA1pZedM8XhhUZZb4KfsJB2rMOKwl/9xVdSw==
X-Google-Smtp-Source: AGHT+IFepnQDpHcqTbdYQgYMHbQ520Q8WNttr0OK2ZunJaGOwvtIFCl5cwFDkeGXluI9lcMo/d7pvw==
X-Received: by 2002:a17:906:e08d:b0:a51:aec8:eae9 with SMTP id gh13-20020a170906e08d00b00a51aec8eae9mr4956245ejb.10.1712591603486;
        Mon, 08 Apr 2024 08:53:23 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:23 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:07 +0200
Subject: [PATCH 7/9] dt-bindings: rtc: spear-rtc: move to trivial-rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-7-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1628;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GFvvp+NJ4mdI7BDHKwvdqRInm14P4YsnxCRqORkt+n4=;
 b=bs3zfnUcz5gwpaUPlz/wrRwcwYBcEGy6bYrrJTdSHbRau10DwIlYJxoxpsBmwPdugAX+didWp
 Edw33B+ngJbCvBBtLqoFKH6Nttpgzn3gnZWBbsX7feyzl34c8LGzx9F
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

The RTC documented in this binding requires a compatible, a reg
and a single interrupt, which makes it suitable for a direct
conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/rtc/spear-rtc.txt    | 15 ---------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/spear-rtc.txt b/Documentation/devicetree/bindings/rtc/spear-rtc.txt
deleted file mode 100644
index fecf8e4ad4b4..000000000000
--- a/Documentation/devicetree/bindings/rtc/spear-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* SPEAr RTC
-
-Required properties:
-- compatible : "st,spear600-rtc"
-- reg : Address range of the rtc registers
-- interrupt: Should contain the rtc interrupt number
-
-Example:
-
-	rtc@fc000000 {
-		compatible = "st,spear600-rtc";
-		reg = <0xfc000000 0x1000>;
-		interrupt-parent = <&vic1>;
-		interrupts = <12>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 0f773167d32a..d75c93ad2e92 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -81,6 +81,8 @@ properties:
       - ricoh,rv5c387a
       # 2-wire CMOS real-time clock
       - sii,s35390a
+      # ST SPEAr Real-time Clock
+      - st,spear600-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - whwave,sd3078
       # Xircom X1205 I2C RTC

-- 
2.40.1

