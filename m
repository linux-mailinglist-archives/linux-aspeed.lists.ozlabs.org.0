Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD895790A
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHr1R4Pz3fvB
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l1fIsqBr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtt61Nr4z3dWW
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:34 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a51969e780eso555828166b.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591611; x=1713196411; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3jReaO8bBGw6JBZ1RkUcA4thqN9iUeRzORfBO64Zek=;
        b=l1fIsqBr/LToZE+nqI/kE2g/mudH6k8y2uOrjHYWBtJWXpfUl3V1Jvs7tFnnVuskNa
         cFG+YRyuCJRKZaZV1d5wPQeZb82my0OxTC/mqPMQZvGYPJs0jW8rK00J/70cls8w5X5D
         azg2QkstqYmOCYXmZx5xV37di6XRCNFADhc/ZOl3cnw1ZNqtAm1zgrHq5GbpFBmT9o8o
         eJCythEah6wGE+ADwOp3/cYIGDm+sW/vsCXwJgkvk5pfm7suvcntenJj1nvkgJeNGWT1
         pU7RalHf9Q0irW2z5LMgjN3ptfs3kDDXwvtGKatpUPLVWBgk1Mk2PdGX4q6pcAKrxslY
         2vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591611; x=1713196411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3jReaO8bBGw6JBZ1RkUcA4thqN9iUeRzORfBO64Zek=;
        b=wy9pUrMsjhBNKGR0/r45Vs93qqMD2u9kVvnL5o9X+JNR7JkUjjaJ3tSR29MSlCk5dB
         2zJ31+jgyxha3tvr8Sv4WasU0g0wxihNvx/mSJqXt571w33g5QA967cz/7tZLgBtsoSn
         XreK3pVDV/5vjb9L3fLXUxJKEPaez4MmFMAx7hT3EUp2fB1MtYvIFC8+/1JT98eqjVar
         +wmIgTZa9WJM4PYbVp3ZfSzBRMKRDvU48WHZZVrYYT//fVcySlzBPvOvgOu2NAO9B/+8
         apTpX8a16ra/y6g8rhCaOhR7y7BndEDNTRbEq4yXiEkyYilU16mOb6tUH10Mh/Vk0SwO
         keTw==
X-Forwarded-Encrypted: i=1; AJvYcCVAuMFTj0BCQ6ecTLhPFdM0Wz6rkZHBhwp47tIpQllEpwue2AGqtD7bzpj8/NLQJWVioYZik3cQRgVLNi5pywa1k+ozPyCTZIhjZZUtZA==
X-Gm-Message-State: AOJu0YxX60EUo3S/3jwRfB6mXh9QeqJQNhqrM+S4c8RJTU8us3XDBOI6
	MOr3D2cmY5CkJ/1ICtjPSPmP+h6lGvhSKf1qRc5f52hWfK/Qkh2M
X-Google-Smtp-Source: AGHT+IHDUn7lM+m3JJro1I7sX1HqWbE56mUHHewyuVneCeBjUwlfT2HuBoGiCiRi+8XMgC8ngOpekg==
X-Received: by 2002:a17:907:9485:b0:a4e:375d:2573 with SMTP id dm5-20020a170907948500b00a4e375d2573mr9215871ejc.37.1712591611213;
        Mon, 08 Apr 2024 08:53:31 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:09 +0200
Subject: [PATCH 9/9] dt-bindings: rtc: via,vt8500-rtc: move to trivial-rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-9-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1714;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=vM6749OZUGmuUGhDa/POZy+5vZeS+6APRIR0QdxNkUs=;
 b=g1Gbrdrf/K3DdsRveFmOObYxG1SgqzZ8jrKc7OFyd6Mhf+VVcEjwfoBwytdkuegPork4KUfuS
 X+/UsMcNJb0DUbXRodaJxuNiEAk9sWd0n6FZbuyavNg+PpigpZoRRlR
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
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml   |  2 ++
 Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt | 15 ---------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index d75c93ad2e92..c48d0dfa28b2 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -83,6 +83,8 @@ properties:
       - sii,s35390a
       # ST SPEAr Real-time Clock
       - st,spear600-rtc
+      # VIA/Wondermedia VT8500 Real-time Clock
+      - via,vt8500-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - whwave,sd3078
       # Xircom X1205 I2C RTC
diff --git a/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt b/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt
deleted file mode 100644
index 3c0484c49582..000000000000
--- a/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-VIA/Wondermedia VT8500 Realtime Clock Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-rtc"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : alarm interrupt
-
-Example:
-
-	rtc@d8100000 {
-		compatible = "via,vt8500-rtc";
-		reg = <0xd8100000 0x10000>;
-		interrupts = <48>;
-	};

-- 
2.40.1

