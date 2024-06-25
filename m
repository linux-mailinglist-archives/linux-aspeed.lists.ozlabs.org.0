Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DDD916789
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D3sbp9DE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTT0ND3z3dH4
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D3sbp9DE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSv61jzz3dng
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:21:03 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70665289275so1692778b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318063; x=1719922863; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXlYaImuhyzLH4pYO5uD8xNkBf2rJUj2xPuv+IWcoog=;
        b=D3sbp9DEPC3kuXKjWaU/iGTnfO9Kbz4sC407ae58qV2awyE4h5Dw/OQhSTuK+Lm3jh
         z0LV4vsDNzdwUhDRgBBpZZeE9i85eiCqGS016XIbugdD+AgONReny8/d1Kabo9pcBSOu
         7AM3NHsdWdFG2Fxk2rzdqPZgzUyoYSoRM/1L3OQL+f454a0PK4mjM+amGJE2cCfPV1Rp
         +3mE0sZi1exlvwoHAUlvQBHOsZIoVTv+6qqGrF9aQ134vm2DOGaimjGkgM2dL0V5aXsh
         EWN1U73NLC8tmvc1fl8EZYVqA2kvkuoNAn53BC4r0MG0wRdOxHa4FCAO4ZLac4E4NFb9
         gc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318063; x=1719922863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXlYaImuhyzLH4pYO5uD8xNkBf2rJUj2xPuv+IWcoog=;
        b=JS0lIx2sI+vcp7er1kM25ylEGIfc+Xr0ZAYD8CH4tdDvh/iWVOmYsevSjG8Bker8k+
         B7qGkQXsAh40sZrbQ1B3zQOTCk+p851AFeSKIMjZWfLz8Yo3HTDz9VA4+xKJ+wORIuZJ
         EhzttVfK8Fs5aYzX2kWc7hxgGB5jdUwHrNRhI8/FXv/83SyaJ++yzk3KbPp2h7K0yObo
         aeY2XDRGOyXmiLqSttsI/Koc3o+WfM5xlhD0q5hS5zGSj7EBb2a46n1U2MrgcYlytumV
         DaGwcwO03KJC9beCwurnu/JL/I13eQRrwiOXjiCo4YHEYBY5WH3Ieryl0Cceqe9niKz6
         58cA==
X-Forwarded-Encrypted: i=1; AJvYcCX3AC96jKwVGvB73FdgjOF0xuLiTskY8zS3gjVe+6BL3F7eQ451Ixm8eWY7abJSFTvRlrxdnLGKoRbqfijZt0MR4cFA+tCHqclTAlfhwA==
X-Gm-Message-State: AOJu0Yw1ke3WI5n8uXc2aLcmv8TZTcTmjCcayhi+5U/02DB/vyLbYj9C
	8wkp3fml6ROLMEN7ZO1OZWEXHOuk6julfEwg3yfRGA+NJrHjsDhL
X-Google-Smtp-Source: AGHT+IF9+MgAE+eccf+8vrgxyv+i3L+xcqs0riGfMjQXInNcrydpeZHHWE5cWwB4YshZn99ZhQ9Jwg==
X-Received: by 2002:a05:6a20:1719:b0:1bd:25bd:ef6f with SMTP id adf61e73a8af0-1bd25bdf203mr972374637.18.1719318063337;
        Tue, 25 Jun 2024 05:21:03 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:21:02 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 11/17] ARM: dts: aspeed: minerva: enable ehci0 for USB
Date: Tue, 25 Jun 2024 20:18:29 +0800
Message-Id: <20240625121835.751013-12-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Enable ehci0 for USB.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 58a083536c79..830616663387 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -552,6 +552,10 @@ &adc1 {
 	pinctrl-0 = <&pinctrl_adc10_default>;
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
-- 
2.34.1

