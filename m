Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0578E723
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 09:23:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZNHKpkgQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbt123fDpz30PJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 17:23:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZNHKpkgQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbt0y0m19z2yVR
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 17:22:56 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c1f7f7151fso3231255ad.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693466574; x=1694071374; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Lofyhd33uMBJ+ToOK+tKMDmw25lr78BBj5RQAypyI=;
        b=ZNHKpkgQ8KnEwMalrUnQbxoCOBiFJn2ryMsg3OmwiiyPNg/UrD6sFPxQQIPZUhKRSc
         NRoF4BE9UWch2vD1y/PUaMDShYhVSXpRnOLRnd62JpNqVgZb9cFN+rXqxdROaeioJxxc
         j2RTz4DaIlwbR7p/gZFtVw9uuV8goKz/F7MVSD/q86Df3b1qlaGxzU01gnT+PSrd1meG
         KfZgaK0smDARDIfxB9C6nv2fYHAQIgdMdgWTtlRYu6PDvEceTzzZvnfl26nKQBvzu6Jw
         58a5FTYZh7sBVvfwFEQDIcpJ6clFoTLwpdWzrnTwY6EYN4BjqCeqpVhJyAPiU3eVRcQX
         05eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693466574; x=1694071374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+Lofyhd33uMBJ+ToOK+tKMDmw25lr78BBj5RQAypyI=;
        b=eWtj5f2bGHgibih8+Xep34QM6pr2gf5g+QwVGX150e2CKcfZYDHcJAcMe11bm8QzTk
         VMqSouBwBTdPTSMzLjeHrfkVk/qMMazlzsRqcSTnBHxEMmPHDW3J3Aw26PIuuRG0/3s/
         yaEktxnFyK/joF5piJVDdML8qJGETmBUKzSrrCKDzNGgtaknSm8W/XzD/iKfG1kSbn57
         JTtXjz5jOL+5yN817U+GH0P1ZCcbxalB2/z4CapPEgEknmaNMFUDXpLwdOOhvyuxNUiv
         4VYmOrgwBa+AuiP0914sDLeDXDI3UGwaZk0fZC/6h2IDXUS5HzW7N0ZzF7qI4NFJrohd
         9Prw==
X-Gm-Message-State: AOJu0YyjektD3oAgXDyUrnA0/IQlyDuOldVLOGGZ0FJFWXS5ylJ+gQIW
	1wOTm9ENfHaY+CnHoIk/bZM=
X-Google-Smtp-Source: AGHT+IEHk+t1Wy+PMcS1vCgFZpM2AFndRd8x1kKereWVkYMryh93skTwtd4kPQtLBaNqkpEiRwmAvA==
X-Received: by 2002:a17:902:ea11:b0:1bd:f69e:6630 with SMTP id s17-20020a170902ea1100b001bdf69e6630mr5152249plg.65.1693466574056;
        Thu, 31 Aug 2023 00:22:54 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id z11-20020a170903018b00b001bf8779e051sm628794plg.289.2023.08.31.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 00:22:53 -0700 (PDT)
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
Subject: 
Date: Thu, 31 Aug 2023 15:20:45 +0800
Message-Id: <20230831072048.3966398-1-peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Subject: [PATCH v6 0/2] *** Add Facebook Minerva (AST2600) BMC ***

v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 link : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/
v4 link : https://lore.kernel.org/all/1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org/
v5 link : https://lore.kernel.org/all/5347163b-c225-d805-d851-fe28e6b57c56@gmail.com/

Change log:
v6: 1.Correcting the arrangement order in Makefile.

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

