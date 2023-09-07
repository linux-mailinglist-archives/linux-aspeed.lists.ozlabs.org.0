Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 738F8797051
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Sep 2023 08:47:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OxxxOXL9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rh8v70YbFz3bwb
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Sep 2023 16:47:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OxxxOXL9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rh8tx5LCFz2yN3
	for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Sep 2023 16:47:35 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-271c700efb2so432894a91.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 06 Sep 2023 23:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694069254; x=1694674054; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz1CUuX4Lqr3H9YMZSLBvjxqKju+LCrPSB9wRJoy7og=;
        b=OxxxOXL9U0Rm3CCqCKXR1uCKCn90GJ4ApwTr+SiWngDBShxgD09NYHLE8Q8Ofa+nax
         0jOjCM5DWxHD70xFNGdcdl1AszvA3sTkVGwRjLCfB64ByplJaXO160rY1O/r/X5xVEM0
         hg8LI67ZG8njSOf5zQF5/O+X7dcl7HxPZEj1h60vtPljEXXVQ+A8sjRXOXzGLnIMkMYP
         weqi/nVdmEVJZgPy/xl+d8yEEc5PTYJINxDhWly2xYAKo3QSyrZFOxlwnNtDUHWsd7Qa
         +w1/mPA0jPjCMNPj1HMxGvFQR1YEZFUzl3CxCWGkQC5CnQ1XRRBiRmpfy6cRZy5P2k2R
         gABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694069254; x=1694674054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xz1CUuX4Lqr3H9YMZSLBvjxqKju+LCrPSB9wRJoy7og=;
        b=LBL72D+j/Iyhr1qHwtCZ2mAhxZ9kdy2kh5rj35WguCF7kvpc9WOtUlNOCSX2iYm3pl
         3lGA+wSFF5IwRSY1Qa61cjyyaPHJzSxcooYeiPrGIN5CJx3peXtC0F/obp0BKtnQd7Xk
         2pDxsaK3hqN3CoB6FEXRuIPx4uUeO+XLrMuGKo5byb7oPLmnbYJIm6umcxH6lToiymlx
         RYikW0DSIeTRSdC6ORFaL8XbF7kf+jpujYxwovhiLF9BFdc4Ac6myLl+V7cBk8lTf/rY
         GARFyXTYsmv3ietpdCSLLvHH3vYXBzKIRg+uVEm7uhoDmhX9Ldq1baV5klwua5YAIFMi
         QZzQ==
X-Gm-Message-State: AOJu0Yz57e4Xlt78Qz9R/xyntHNK7adYLRAU+Nk/+PKtY6yYVuJ65hiq
	/AV5H+L6dfYiQUGDl0xCZoE=
X-Google-Smtp-Source: AGHT+IGkO+3/kmpKI6RcvIIJP4NO5biUIJlKEEfNyHd+ec55kHccx3KTzS3/hkpRB7iMaDNNiON7QQ==
X-Received: by 2002:a17:90b:1e0c:b0:26b:6df8:eb69 with SMTP id pg12-20020a17090b1e0c00b0026b6df8eb69mr14694789pjb.1.1694069253770;
        Wed, 06 Sep 2023 23:47:33 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090ace0800b0026b55e28035sm800439pju.52.2023.09.06.23.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 23:47:33 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/2] Add Facebook Minerva (AST2600) BMC
Date: Thu,  7 Sep 2023 14:45:11 +0800
Message-Id: <20230907064514.1764010-1-peteryin.openbmc@gmail.com>
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
Cc: peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Summary:
Add linux device tree entry related to Minerva
specific devices connected to BMC SoC.

Change log:
v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 link : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/
v4 link : https://lore.kernel.org/all/1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org/
v5 link : https://lore.kernel.org/all/5347163b-c225-d805-d851-fe28e6b57c56@gmail.com/
v6 link : https://lore.kernel.org/all/20230831072048.3966398-2-peteryin.openbmc@gmail.com/
v7 link : https://lore.kernel.org/lkml/20230831082819.4000425-3-peteryin.openbmc@gmail.com/
v8 link : https://lore.kernel.org/all/136c0434-a588-877e-54e5-dd1078ff94a3@gmail.com/

v8->v9:
  - Remove dts jtag1.
  - Remove blank line between tags.

v7->v8:
  - Fixed dts path

v6->v7:
  - Change order before aspeed-bmc-facebook-minipack.dtb

v5->v6:
  - Correcting the arrangement order in Makefile.

v4->v5:
  - Remove redundant blank line.
  - Correcting the arrangement order in document.

v3->v4:
  - Seprate dts document.

v2->v3:
  - Fixed commit description.
  - Add sgpio line name to sgpioP.
  - Add ipmb debug card bus.

v1->v2:
  - Add facebook,minerva-bmc in aspeed.yaml
  - Use stdout-path
  - Add Makefile

v1:
  - Create minerva dts file.

Peter Yin (2):
  ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
  dt-bindings: arm: aspeed: add Meta Minerva board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 377 ++++++++++++++++++
 3 files changed, 379 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts

-- 
2.25.1

