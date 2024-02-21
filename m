Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D324285D3EB
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:42:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jfnWFLCM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfrsK5R1Wz3dTs
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:42:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jfnWFLCM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfrrw0cSKz3cGg
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:51 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e45dd96437so697482a34.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508509; x=1709113309; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02YQN9leMQs8Y5hO76LXmTuDvuIJ1BaLoEHOXqsFQkU=;
        b=jfnWFLCMn6PTchzXZYzyj7VbSKV3MU8VkOl0H3r0cTC2l/fsvIERp49ABMlGQfP9sA
         9KR8tJ3anUHPLy8/d3Unl9eh0Ai2V65uGqokVlVTQ5cbfw7345HsJPkqavOn0CI7sRp4
         AfmfN07eCAw6+dkwZR0lSt2L5ME58IY8h//+ba6W/tXJz906IsNfTo8DPLoNq9KU0wgG
         8JSIKEp3LmGySClrPY/MkkqJiGp1xq/a1NeYgsoCJlmBuBgvhKuj2K9U+A/pXFvx+cIU
         SAgjJDRmLhMxrQWMlwy+YKMZdWfoN5iki1Aew2339EtcxEtH2JYleyl0bI8uGdRjh2JA
         uITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508509; x=1709113309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02YQN9leMQs8Y5hO76LXmTuDvuIJ1BaLoEHOXqsFQkU=;
        b=XgMCM2/6GfsP7eskz2Ldk7Hs8/UwFiHeMByJz/cVxLUp5qSN61f9dJIVMF0kyaozCQ
         XbV8LM4iPsAdlaUouSXD+PNbX/h/qRZeuWpZhDCRVkQBDNVqzqJWP0tEBOqQm9koLV5a
         gHegC4MWXSLUQPHUm9jRcbANwi+GLyCkSVpBD3jdKWge9vuKF7k2Eesqzd7r7PkwdAP7
         if/h7sUoGqvd2ay0cxjiaj5qc81WA6vyd6OBqLHNjzQFbvm1El608yxDohkEVH4KsEOU
         8352BGBD+t5eaMWx9s2HG5d6jkK7G4q/dYFGPtkPha6DRfbuGCDjP+wdo84mEKTpQ7iZ
         73Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVHak5dqOKjMq6W786XhVgygg4GhQ+DX0VkDstyagQIMFn2AkLeuzuL0HQ/RwwlGjNKbqFX6SgLV/Y/BGRnnjVdHe/fjQlqC1tj6iNx0A==
X-Gm-Message-State: AOJu0YxAYlcKOAcEzZTPxYK7QXbfs8f5z1HG+NGzYGL1Hm9Vh3dRUBws
	8pDHrWutzd5mQKY+W5tNULVuvxIXOxPqdJ8aML3EHEncP0HKuVXF
X-Google-Smtp-Source: AGHT+IGzABeCompCAg32fwPlToc/7w1feuY1z5aA994Hu9a3puthAAGIl3l5oO1Oh3zPZMFSO5rVFQ==
X-Received: by 2002:a05:6358:4883:b0:17b:5a95:9902 with SMTP id pe3-20020a056358488300b0017b5a959902mr1537315rwc.2.1708508509139;
        Wed, 21 Feb 2024 01:41:49 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:48 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] ARM: dts: aspeed: Harma: Add NIC Fru device
Date: Wed, 21 Feb 2024 17:39:23 +0800
Message-Id: <20240221093925.2393604-9-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
References: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add MB NIC Device

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 83da7e46bb42..d5c5c5b3ab4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -207,6 +207,12 @@ tmp75@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	// MB NIC FRU
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
 };
 
 &i2c2 {
-- 
2.25.1

