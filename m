Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BAB78E80A
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 10:30:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UqX8XvtR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbvWD5LCrz3bsP
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 18:30:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UqX8XvtR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbvW44h9pz30D2
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 18:30:40 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68a520dba33so468374b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 01:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693470638; x=1694075438; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=UqX8XvtRN8L//ojkKIjNg9Zu35KDJmao90ToXfLGGs25AzUkqGq3Ae0YpRhhNCy0A8
         KjXA7Ud8QyLi1bYYnE/g490GsJyAot8dYi+F1ZFVZOrPZmb1P9uXUKN4oulncq/e9peF
         ArJPE5S3TZFv4pYRYoSyOv4doANGO9plEH/vYiFSBeCDWExBg3z/iQFCqyYV8H9hIYM5
         raTHDEIoTIlv7Cc/lB8j9R5HInhvmXnSvAnSNubnVOHwgxnX/ZZMHQYRfEa4wAODf1Zm
         FLP6efqGAkZ82y5I1No9op0GAoj/1RPiGdyPpM0M2NGGHasTYw5i9lpciz8MZDi0f/Hm
         uVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693470638; x=1694075438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=YqVk8CyfSJWPzDEuTeekfomopx5XPUupknPXw8Rr6lzCnMsGn0nRxpZjg97got2X0K
         0jyTixVqCr4jpCj7zMmW2E390/mUhMOAUXcfuoP6iaINESHdVAafhX9UOrRljHw6sI3k
         wVj0X9rNaj7Fu5UJVwAWI2/Ug5IIUCZbzi5Y2dCTfUlUv1KJLbOjWYx/uzCRnR/j9b5I
         pLy8Qe0tfX/0HUlW7uuk3mJDtP5ZFsplu32jnmDCqBG788POrRDaUop0cBQQEL1MMeng
         LVIaGfMpSvmnKuCLFPZiM/BO0L/SFbZcL+5Nz2tXTcS7tjwK0aQggc4OROMel5p/6V/X
         oSvA==
X-Gm-Message-State: AOJu0YwSegFW9Ez86WaE4Od7mHWbe0WwxxRDP5G0AqXyEyzdYITJPq4Q
	bTRxC5wQA0FFKf+FYvMmQDnRPzU+vjW0vA==
X-Google-Smtp-Source: AGHT+IGJ0sJH/K/tzzupjuyRlTkxXV5KC1GX2bDuoSlnYE5+YMUZE9wWtazb3sOipXp4chWI3AmNYA==
X-Received: by 2002:a05:6a21:3d83:b0:14c:d5e9:211e with SMTP id bj3-20020a056a213d8300b0014cd5e9211emr4640510pzc.35.1693470637972;
        Thu, 31 Aug 2023 01:30:37 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a17-20020a62e211000000b0068a46cd4120sm812253pfi.199.2023.08.31.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:30:37 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Thu, 31 Aug 2023 16:28:18 +0800
Message-Id: <20230831082819.4000425-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
References: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Meta Minerva.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 6b0a6683ccae..3b93bae4f43a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-bmc
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

