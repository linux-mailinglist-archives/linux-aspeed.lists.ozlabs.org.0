Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15176F5F0
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 01:04:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=B1FXxq3x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RH4Cf0Kjfz3cND
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 09:03:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=B1FXxq3x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RH4CF707Tz2ydR
	for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Aug 2023 09:03:37 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bc34b32785so10840925ad.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Aug 2023 16:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691103815; x=1691708615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxdVo0H4Ogsm6y1B4bh/ICRf8zL9r8pBxK6Ht1YN6QU=;
        b=B1FXxq3xyAYEetNblcpVr3eqFdEVp27JMD86CR/EggjGafPeF6E0Qu787tQ5KXJGaT
         v2cPuAg+C1i93EfB4TizxepVrFZH8lbPopNs//XFToHcKPt5EXql5L4sydDrtAEgDsvW
         f2UVLu+Cpk0mTfsWlJMwdFU4oz6sy4l3L+mV/ekGiYJH1pmF1SfZBDh9hW+9YKLB/FHB
         QHPhqIEhBEYI0QDXYfS2Fg2SYwf6oa9VXHPJ5cFl9WkyNe5Zhk8E2dYjAKBWGU11l3w1
         kexodF7CcnK1IgEvhp6oc1Iwrt7FJ/5T8UGjWZXMGMCAd2UhG1T8XjCm6XfX7nwj69t4
         eDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691103815; x=1691708615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxdVo0H4Ogsm6y1B4bh/ICRf8zL9r8pBxK6Ht1YN6QU=;
        b=WmdxKdxOjdQ6ImKHlNxoTVrvSKdWmw7W8EpByy2TPKIQo09cPg0vEAK+33IqJXw52d
         rLNPrCGU5P6cuNc+J2mC9ZBNusv5AQQ4z2FPCoXoMJdc8/UTlcW3HYMr7ZMRyeQ9Jiba
         xWmKIM5U25ox61fp3MxKCnbotXcHoymAH1LmpGqFHuSQ5H3egJB5hiT0dZ+R2WEKvwfH
         BBk8WZddsywHFvlR7zZQxPJeVPLeGmmfRNcgMkiS/uShdK15Re5oiVUW751A0k6swlNT
         DzKJlKh1NZxs74U8xYmwH5MwD0/kP1vSsfRzFA3LWBKo8bXntU0k/X1+w51+bjkfQp3Q
         X4Kw==
X-Gm-Message-State: AOJu0YyDGg70a0qKr4x2cSfem4JaSTHE67yC9cK/vbHMHq3fTtSgLYIw
	IzvnyRzbZtpHxFyJfXut8Mw=
X-Google-Smtp-Source: AGHT+IGTLIqDQyKKtQsXBAKVqKtFN5RUGOE+6K1WmgCYMpo3tJqJIIm02ZnnhklD8xBZED4d9EF6UQ==
X-Received: by 2002:a17:902:b78c:b0:1bb:809d:ae72 with SMTP id e12-20020a170902b78c00b001bb809dae72mr115625pls.33.1691103815263;
        Thu, 03 Aug 2023 16:03:35 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4.thefacebook.com ([2620:10d:c090:500::5:e60a])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090322c700b001bbb598b8bbsm372349plg.41.2023.08.03.16.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 16:03:34 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	taoren@meta.com
Subject: [PATCH 3/3] ARM: dts: aspeed: wedge400: Set eMMC max frequency
Date: Thu,  3 Aug 2023 16:03:24 -0700
Message-Id: <20230803230324.731268-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803230324.731268-1-rentao.bupt@gmail.com>
References: <20230803230324.731268-1-rentao.bupt@gmail.com>
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

From: Tao Ren <rentao.bupt@gmail.com>

Set eMMC max frequency to 25MHz to prevent intermittent eMMC access
failures.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index 5c55afed946f..d17b977fee9b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -367,6 +367,7 @@ &uhci {
 };
 
 &sdhci1 {
+	max-frequency = <25000000>;
 	/*
 	 * DMA mode needs to be disabled to avoid conflicts with UHCI
 	 * Controller in AST2500 SoC.
-- 
2.40.1

