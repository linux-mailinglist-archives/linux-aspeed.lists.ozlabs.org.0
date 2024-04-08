Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E97957902
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHp34Mlz3fnr
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h9YbnyeN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtsq1hGyz3dLQ
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:17 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a51d83fafa8so132011566b.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591593; x=1713196393; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaDQO9exJCzRg/8lU1QpCZomsB1mdrpwg8BXuiBSkkw=;
        b=h9YbnyeNfI1Dl9uuoVInE4fryphHWjOB9pbkglNq9vpI7isckaiAWz1ua6S7G+6fOx
         JjAg6w8cBG7MIPQq+edw8s/pjPG+i/6358I/QaFwEB6lDWURExQYCTz+L4QnWlQx/9Io
         mvd9VgbBtAXfSTy+HhWhialcK2PjKAL94nDoFyoJSXH1OezwLMzdbITEFLIrgcWFJSsa
         Lc+aoSNmZd1VafG5tA+f31HXjP7qrj6a1rYbfhBO67EBGTGQQfZby9Ef1ZBWmpxAljC9
         pO19Y8Gv7vrranx1ZjFbU6LNtL7jwG3+a70fue8i59QMRCqfOhe0P216g4BkraSyPiU4
         zA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591593; x=1713196393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaDQO9exJCzRg/8lU1QpCZomsB1mdrpwg8BXuiBSkkw=;
        b=fupOwPNg7oSSzCkL846KFiQOiWr5w9rCwf/rwK8qez8qQ1kUQ1Nf3rACuBmVMnfNXj
         IVQ+8dBL7kLdu8vc2TWtqqg8zKq1wS1FY+eSrvnmo4BZv/MPTX2jl25Iq0gVq7L4j5x5
         /bIEJl+BuA2krlybNKqpEU9m+tovPXsFZ4noBl1Dde3MRTn7dFBtug1tTlkoBAlSLRH/
         Jdrkth5D0VY8nosyCCa1L1rCl97TNLN1FI7d2rmQhNu0vmxSnjrgvH6CLgoUVDMVSawP
         MqKSMg/YgHl5zhwsvfazUQKM0QaHTUXcLvFqoG84CObkq0dHA9D8fy4ewcoL3IRW+sBz
         YPvA==
X-Forwarded-Encrypted: i=1; AJvYcCX3h2/jvZb4dDXbxZQ6j1MRdDBLBIgMWzZ5wBLHGECBTIAOhdPPlWZglA1Na6yLJmVmftXWVSHhzW90z3x8/OuZwTMHRIaXtOP3eQoqrw==
X-Gm-Message-State: AOJu0YxGRL1HWADrnMZBtrlo/rsEd4WIrTXq6s3SYaF1IIn7SQDdOAJN
	+3L8gtIavhYad54Xu/pVWX7khTmOjV+/xqy4A5uVAm2MuXNwrzDC
X-Google-Smtp-Source: AGHT+IE/brPz33bAyXkLLx9/3k7uLX80nlW2dTvsRmtq/VzJ5UavkRJXVX2o3jP/+Rc4Wx3RPpCuEQ==
X-Received: by 2002:a17:907:e86:b0:a51:d204:d6bf with SMTP id ho6-20020a1709070e8600b00a51d204d6bfmr3422101ejc.10.1712591593166;
        Mon, 08 Apr 2024 08:53:13 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:12 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:02 +0200
Subject: [PATCH 2/9] dt-bindings: rtc: google,goldfish-rtc: move to
 trivial-rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-2-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1751;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=yqX/w81Ycb9hVyt/9HQKZXov7UsFMLnZ7nkrSKxqels=;
 b=nQu1d8ztJV2beU36YHMkXGrFhsTXDnsy8WQADo7Rpyj2BA9JfhN+W+nzzj5SHdSULv8HsoK8G
 JkFOsCM6XmSCJFwYt5mlM9kQzi2tSTNFnTOAjB50Z0RwcSmfJ/9+RHz
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
 .../devicetree/bindings/rtc/google,goldfish-rtc.txt     | 17 -----------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml  |  2 ++
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt b/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
deleted file mode 100644
index 634312dd95ca..000000000000
--- a/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish RTC
-
-Android Goldfish RTC device used by Android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-rtc"
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_timer@9020000 {
-		compatible = "google,goldfish-rtc";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 5e63c8f7f618..b889b9317a41 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -41,6 +41,8 @@ properties:
       - epson,rx8571
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
       - epson,rx8581
+      # Android Goldfish Real-time Clock
+      - google,goldfish-rtc
       # Intersil ISL1208 Low Power RTC with Battery Backed SRAM
       - isil,isl1208
       # Intersil ISL1218 Low Power RTC with Battery Backed SRAM

-- 
2.40.1

