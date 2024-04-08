Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD5957906
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHq2Hjyz3frc
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J9Wp/8z1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtst5yKdz3dBn
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:22 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a51e452a1ceso44316666b.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591599; x=1713196399; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rI91zKEHaZphCjid+rr3ztF+AksAKCVPYsgJBuGJSE=;
        b=J9Wp/8z1EpQq9ucP2ECK+g8c+ylJGZd5jgvfIJVYct2wFlVv9DYGA526hkWr5VKtQO
         w8QbY9H8zfQxpwoESynF58nnq1ZFXfeNWunXTEHxf4WmoOG8ez2v96Sria64aPwd0ZPV
         vZ7/PoMeUyn6DbxtNJI69mdJ4A/2GWrhTiEeazf6jFqJ5fZ+y089j6ohzAddaYZ2eoIX
         BctoUf521RIspSMvq+H9ZbzSZ2ib+KzuDrPD4Eh8CIbqS0JXI4/BqbS4XfbQ3ZesfwsE
         52RAFBHk/N4chbvRiKCMrNOeYFiadSUpi8LfeSUjYxraDaffH2EEMaOtMNYHZpELx+ZR
         Rvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591599; x=1713196399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rI91zKEHaZphCjid+rr3ztF+AksAKCVPYsgJBuGJSE=;
        b=eNflPo8wSQPrE17M8uTqPD9c8sHbdfsNC/ZHFaXfgKKieHcX2rw/HPJCPeLExKRrYD
         bmPDDrflS1h6yVzAmCUzsgn8EUS63EQS2a5eEeS8/LtQr74GxC5pOh77XDwiBDRAdlzK
         5lpPUs/UOi+0Cc/aXS41VR874uQOvXnFTgP9brbtCJoDtiwkn2mzDNfno5WD3DacEo6f
         iIfL5wPIuKwOeqp1orjB2BR2WXJW512lvUd2GRl7tEklo9A3ipadZ9BNwBDOz0BpU2Hf
         h2t7amRDJxbytvOzbnWAnIxc9u0dMtz2H1pR7UBljIY+rhh0ee4qQK61sja4d+uU7TvI
         +zYw==
X-Forwarded-Encrypted: i=1; AJvYcCXUO/0iNZM1Q2meam9EAkGOkUkrRFMOYMrdAB66wY9/+YhGD5QmjQRo7WGufcmyweXabBkVHO75S5Igjha++lbsT7+WIbMJMrgosz8N3Q==
X-Gm-Message-State: AOJu0Yzx2gB5bPkrfwio7Wf9IRehelBtn8sNjj5qc76HMpoxfArf/ZnE
	WhRZwViFHSIq4YAJBUBMQoiJOBw3BnV7h77Yuhnhxkc1W9gdKvCi
X-Google-Smtp-Source: AGHT+IHimdaFx4mr+fd5liP9CQQHQfUAme+YF2mKZ7a1UnXQ6iSPME0h09ObN08oeUq6W9IgNv/UPA==
X-Received: by 2002:a17:906:cd03:b0:a47:4a32:604 with SMTP id oz3-20020a170906cd0300b00a474a320604mr5925265ejb.26.1712591599181;
        Mon, 08 Apr 2024 08:53:19 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:05 +0200
Subject: [PATCH 5/9] dt-bindings: rtc: rtc-aspeed: move to trivial-rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-5-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=2126;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=UiEej7wlBRi/pLQoBrweryeFGNwfjKuxoShA6lE5rgI=;
 b=EpHnh+7FpXHoZNz9WVmqztAU819VB3IfAfjePtPHE33EfG9pOWc64lH5c4iJGsPPAkiXfkCFM
 67eNi1/nowwB6ktD5i9GayFdEXGoC8VcQqXJvBH2aLTYW752caeJ2Ze
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

The RTCs documented in this binding require a compatible, a reg
and a single interrupt, which make them suitable for a direct
conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 ----------------------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |  6 ++++++
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt b/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
deleted file mode 100644
index 2e956b3dc276..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-ASPEED BMC RTC
-==============
-
-Required properties:
- - compatible: should be one of the following
-   * aspeed,ast2400-rtc for the ast2400
-   * aspeed,ast2500-rtc for the ast2500
-   * aspeed,ast2600-rtc for the ast2600
-
- - reg: physical base address of the controller and length of memory mapped
-   region
-
- - interrupts: The interrupt number
-
-Example:
-
-   rtc@1e781000 {
-           compatible = "aspeed,ast2400-rtc";
-           reg = <0x1e781000 0x18>;
-           interrupts = <22>;
-           status = "disabled";
-   };
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 710b096fe6f7..0f773167d32a 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -24,6 +24,12 @@ properties:
       - abracon,abb5zes3
       # AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
       - abracon,abeoz9
+      # ASPEED BMC ast2400 Real-time Clock
+      - aspeed,ast2400-rtc
+      # ASPEED BMC ast2500 Real-time Clock
+      - aspeed,ast2500-rtc
+      # ASPEED BMC ast2600 Real-time Clock
+      - aspeed,ast2600-rtc
       # I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
       - dallas,ds1374
       # Dallas DS1672 Real-time Clock

-- 
2.40.1

