Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7862B86864A
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:47:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SE44vBGn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL381wF2z3dBn
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:47:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SE44vBGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL2v5hk8z3cPd
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:35 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dc9222b337so19182915ad.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998453; x=1709603253; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=SE44vBGn5F6GufzR09gIDdCBJzGNcX8I/DNH22uncWBw1JiSKzDpXnnbtWyltOnc/e
         T+sEpHlV4++Os+oBcqMzklK7nRB37xCrtMrC0qt1otyUWxM04dCG6HsQHzZ/Pxp+3I1T
         o8MlJFp49V2Nn0AWEh0JbClVF8jNin7VTyQL9kZ6EvkKU77flMLUeOoCJlKbO8qbvhRo
         K6wBHn7zGP2sl01XbfN4HcgwGS+FwPDrjEF5dEEu1HhtmnEHUnXq3tRZbt3PaCfLSWrD
         ezBtbTPmZPqqhgeDL7rs+tjpdVZ4z5CxJ7utFoiDdIYKfWdGxq5sNmeJZ44uDxZEw6SH
         V0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998453; x=1709603253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=cdmRZ5QcE9b2RAIT2YaNk4y+WjShhTdAP7JwXJEW035L5DmWTdSoftaC9bOKXQACPP
         L51RZTNLs08VjUzMwc2NWtV5j/AfZFIvkHCr1hmPJMQy2D7ulGbm1Y6wJ/WKdWvA11BG
         xwy0+00HojNtY5mVqF2iBi21DoZazTWsWn/heQdMlFnX30vV4RuxbL71xaOkHUfuc4ON
         ucdtFYW814CR/ATuL7X5yETbkBFZYUJ/7eGpK4y+r/UAm9/+uneUKOESYg/+AhM3tvXy
         8kuzpzzKigBOHrycGU4hi8Me533vFeMbJLN8APJp181yKRX4vSw3lgTW/mQWgi5THatL
         +g/w==
X-Forwarded-Encrypted: i=1; AJvYcCVUX4ktgo9RHm8an5SL7zl3+ZvRG6HR73pF3Ng7HMTHUqPfx/HTN+a6FcjwYwWr5IJCsc5RWo95RzrPHMWtEVcDloCkPXTQQ/jBPcbTUg==
X-Gm-Message-State: AOJu0Yz+AoitRTbPnOz6ZLHAWc28HlMH1SgMA9r5Z9083rTjyx3BhZYQ
	33ihE17H1ZGQAR80vlEelkM77UQm6D5Qw6/pjJCPYr8KJuc5Og1b
X-Google-Smtp-Source: AGHT+IHnr/SXQx/TUhSGNxXmsbhpF3PDlZn9SdYcK9U4yVXvMpnTPJMMe0fvrUhJncD1RfdDQF4Wyg==
X-Received: by 2002:a17:902:c412:b0:1dc:4190:38f3 with SMTP id k18-20020a170902c41200b001dc419038f3mr12706737plk.13.1708998453069;
        Mon, 26 Feb 2024 17:47:33 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:32 -0800 (PST)
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
Subject: [PATCH v4 03/10] ARM: dts: aspeed: Harma: Remove Vuart
Date: Tue, 27 Feb 2024 09:47:12 +0800
Message-Id: <20240227014719.3037588-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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

Remove vuart to avoid port conflict with uart2

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index a0056d633eb1..5d692e9f541e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -100,10 +100,6 @@ &uart_routing {
 	status = "okay";
 };
 
-&vuart1 {
-	status = "okay";
-};
-
 &wdt1 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

