Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EEE85D3E4
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:41:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jbB0VUbw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfrrw3WMWz3cGg
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:41:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jbB0VUbw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfrrf5W5sz3cSL
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:38 +1100 (AEDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-59a802ab9fdso1217465eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508496; x=1709113296; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=jbB0VUbw4/tgbJt4RnkgQXvM6zW1nYpD88b3UlucBGNmEQ6Qf6ZHZnbOHLbbRT6SjE
         eP/so+UhOVanyYO6avbcYNuErJIcjXozjMSqLxBHY/1aXItA3XOfeiHOmqojzIulIWx0
         dQpVTlG4z909n42Yd6Ws7yJ8uUrVyzXrfZj7OkmUUY8bS1TauMRFDjvyiVPrv+fUGK5V
         nsKAyRgvzawMGrE5d80hB1sEhGyS9cHnR8FV4QAsgJKDuiAZBqKEir9EoNfcMUIUjt6W
         cv2yXCGiI4Mik7knp5BdGIZHg9nl7LuGjvjazyHLGILHZCZCKejEeyr/KBXbuBpowy/W
         MZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508496; x=1709113296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=LFY8jS+t4sXGPq4RhqV56XkbittEcGRthD71P4PtGUNJyUGLo340qEE1TH29zfmk5m
         0CIJcFYr1+ADasIVLfxeqdivO2w3nl10oyHLAgEwhgRbSQwsxUBSQp507hAUV7qlsf8r
         G0Ik4GMmLXasu3mmc4DD3HMRTNWJ8txyZgWn34FAKZD1hncecus54KqK7Ea8jQ3BFGBM
         rkUsW1iFu5o3s8ra184DqLNYB0pZOHyU6HGPAS+DzTaLJriuGv+NnKPgF7xnr9mVOQYE
         S/3MbBS397EAFIRSQTxs2CIVNf8islXw3y9sVyqlPUJS6J6FUl71JruopvFdmy/bAQ4P
         XBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsYiSvI8eRBcxqgH38G/hM+mkIOlAXIkp8M1qc99EH8/scjY9Cd/f/m453dvw0HN/lCexeSxwdZF61Do2SdfRjU8FDe+GFzf7llTqX4w==
X-Gm-Message-State: AOJu0Yy40+ttmTZZgddJmfsnJgin9UJ3b3gD2fNLskQjwFNqK+ihIpam
	+YNOiU/sje4EedDrzOViYwMx+S6knnvio5Mc9WwhFLfvVQLcn7QB
X-Google-Smtp-Source: AGHT+IFCQpC7HA3uB9PkY85VfIE/i8aLJXqvVLcWyjyHXYTxBgCMVh8/XMWAAqAOity415LLFgCe+w==
X-Received: by 2002:a05:6358:d090:b0:179:272e:54e9 with SMTP id jc16-20020a056358d09000b00179272e54e9mr17337350rwb.30.1708508495826;
        Wed, 21 Feb 2024 01:41:35 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:35 -0800 (PST)
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
Subject: [PATCH v3 3/9] ARM: dts: aspeed: Harma: Remove Vuart
Date: Wed, 21 Feb 2024 17:39:18 +0800
Message-Id: <20240221093925.2393604-4-peteryin.openbmc@gmail.com>
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

