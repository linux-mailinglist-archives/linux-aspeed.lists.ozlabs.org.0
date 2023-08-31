Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ACA78E600
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 07:53:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ii70yswT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbr1P4d4xz30Ng
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 15:53:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ii70yswT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbr1910m0z2xjw
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 15:52:59 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68bec3a9bdbso282023b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 22:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693461174; x=1694065974; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3cZF7dX+T51M1ilFDTmCciuWPN/WaDzWfsb09z2eis=;
        b=Ii70yswTc3ih6nRE5lps09oaWcFj+3QbtOT1A/nMRU9kjQWwOD341BZHy5uKiAYeA/
         eivPrq7mdKfzTL3hM5RUv5LJl1YbN1INTTkzl8pyhMwMMm0QyvtbfjD/5FgHNzt1l8nF
         sw0OP0Md/a8dp1XZKlsX/SxMwmyCMw0dVGh8TGznDiDCG5+1JcWsMwV8Mrhj60xpB6oZ
         bRQiFA7rIul/HxAEAishgAEpLYKj24eROCv3eKnJDQ0rzZ0iYCyAV2a4C+ZDS8dIGDaG
         OFlVfFhE+LbcYzoGjV//FPfxLOnM8Yo1AGr1g9gdsCxRqCfmXGO1ajSu1OUl4m7qQyEx
         TUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693461174; x=1694065974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3cZF7dX+T51M1ilFDTmCciuWPN/WaDzWfsb09z2eis=;
        b=WT7ltDMI0pPLZ5qrYeIboeivL0OvQ568Sn/Pvr3U6u8AW2E+xiNQs/runF8+l88g2Y
         JMaXOjqbnXBg+9SlOB5Ym/ZrTtJa/xK+Fg7VL9nbZUzy+vOr7Jbc/BY7YvQjoPZcDJGH
         Jgv4M2KIzxZvImoV7gj9TFBs5UGOqOR5yuU6XpUS8ApYGXf+yGWGO20K3Pv0MDTcAACt
         pkGlzSpJIpEONjXc4+K/iDG5E2kz5BXjmfhJviVuUu7KMu/IhYsoim9GpQX0KtbYwIPy
         MfXGIAyaHvIzgJ86Ton8VNQL7MdykktsN6MfVxoAp6GMAqYsc2S582hEis5sRY5sjja8
         pyzg==
X-Gm-Message-State: AOJu0YwHNJGXkvmEmfxnvOGah6mRBRfHYObhkH52bx1ksFD3c2yox2Jk
	QcEq/CJwrYsapq9/sXxPN6s=
X-Google-Smtp-Source: AGHT+IEdJynyF1sPM1LXLbG7Nu+SIfBmaDaQ/AiHeUYK7hqPLOD64a5I0ezeV+XxRtQWw59aoXR+mA==
X-Received: by 2002:a05:6a00:850:b0:68b:fb93:5b4e with SMTP id q16-20020a056a00085000b0068bfb935b4emr4938014pfk.26.1693461174104;
        Wed, 30 Aug 2023 22:52:54 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78256000000b0068c97a4eb0fsm506731pfn.210.2023.08.30.22.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 22:52:53 -0700 (PDT)
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
Subject: [PATCH v5 0/2] *** Add Facebook Minerva (AST2600) BMC ***
Date: Thu, 31 Aug 2023 13:50:27 +0800
Message-Id: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 link : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/
v4 link : https://lore.kernel.org/all/1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org/

Change log:
v5: 1.remove redundant blank line.
    2.Correcting the arrangement order in document.

v4:
    1.seprate dts document.

v3:
    1.Fixed commit description.
    2.Add sgpio line name to sgpioP.
    3.Add ipmb debug card bus.

v2:
    1.Add facebook,minerva-bmc in aspeed.yaml
    2.Use stdout-path
    3.Add Makefile

v1:
    1. Create minerva dts file.


*** BLURB HERE ***

Peter Yin (2):
  ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
  dt-bindings: arm: aspeed: add Meta Minerva board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
 3 files changed, 379 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts

-- 
2.25.1

