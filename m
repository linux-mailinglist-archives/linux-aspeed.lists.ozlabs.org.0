Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB178E806
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 10:30:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aA4YVa2k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbvW02cKzz3bhp
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 18:30:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aA4YVa2k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbvVr6D1kz2yVP
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 18:30:27 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-565e54cb93aso384800a12.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693470624; x=1694075424; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMjIF994q3qSA6WWBgnks3eIIMa6B1Wh1e0XtMkE9qw=;
        b=aA4YVa2kfX3bjB6NZjIQ6mcd5nD67PAJTs7Fu9BuSFGNrbLv5gpOXm80uPL0yZ2HMl
         a1IagcUKs5ftX1pQlXFhyTvQaQKI8DgXjtBG4rQuVHhTYYwvsPCHGglOT9rlz3XzzI6t
         ROftqIxbOd9jQRg4a9zNhhbMU4xtPkGQNvALIGIkoEHtlBt8MNsJ5WxnkfAkmAXxO8Vx
         Fl9OSAyaStnqq6XKWafQCi4tK8daTyrOi9XIlo4slUSmH3lUOV/bHMt/xOZOGgjhpH38
         lY2Yf4Nf9kFZTbnoX/nZVcqEyh0s+3qK74sD1hNoaVX5m9ItL3jMAv69Ad1YkttuZbRA
         24wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693470624; x=1694075424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMjIF994q3qSA6WWBgnks3eIIMa6B1Wh1e0XtMkE9qw=;
        b=DdHuKdWSLUSh9q2Aq3f1WUVnUcM3pM9Phr+tfWKoJ/AEX5xsytOgUWu/R/wzqFMlQ7
         bJUEuxXl6Qcg6R96sJ95JA06ic8mCA5D/0VsNBUjVnGyPNSiXrdxZjNuHTmeqv7peMek
         SJPCWA2Tzf7HvtRueomFpWv7HdjRAQTZQCL4Sk/tA0PEGibQ28eJ06rnm/AFzU5Y5RCE
         S1bVXm3fE5Zr/2RXLCWW+r0s7weclZPLQa7oqrzWPioaGdzJfSxQRNE/lWAu08u0kU4p
         RFaVZNspuF70uI0g8uf9FxMriMi/+JpBRLFRt4aJDDWNRQIqymGA5G+owta2slV6GBtc
         wfpQ==
X-Gm-Message-State: AOJu0YwFi/3JiwdLIh1TlfG7pSAKAmOqpglIas1aX1ddFwuwDGNuId62
	vzexzViTg4VF+UJIsJRv9UE=
X-Google-Smtp-Source: AGHT+IGq02q6EYdzv4j+dIJgAqXae16JDV44BC6e7208bdXWcap4pw1HaygLxTRCG/9TzNfLH+F3bw==
X-Received: by 2002:a05:6a21:71cb:b0:11f:6dc:4f38 with SMTP id ay11-20020a056a2171cb00b0011f06dc4f38mr4826670pzc.55.1693470624065;
        Thu, 31 Aug 2023 01:30:24 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a17-20020a62e211000000b0068a46cd4120sm812253pfi.199.2023.08.31.01.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:30:23 -0700 (PDT)
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
Subject: [PATCH v6 0/2] *** Add Facebook Minerva (AST2600) BMC ***
Date: Thu, 31 Aug 2023 16:28:16 +0800
Message-Id: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
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

v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 link : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/
v4 link : https://lore.kernel.org/all/1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org/
v5 link : https://lore.kernel.org/all/5347163b-c225-d805-d851-fe28e6b57c56@gmail.com/
v6 link : https://lore.kernel.org/all/20230831072048.3966398-2-peteryin.openbmc@gmail.com/

Change log:
v7: 1.Change order before aspeed-bmc-facebook-minipack.dtb

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

