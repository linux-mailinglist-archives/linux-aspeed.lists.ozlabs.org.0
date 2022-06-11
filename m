Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47E54737E
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 11:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKtb65ckcz3c4h
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 19:59:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b+UduNbJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b+UduNbJ;
	dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKtZm029Pz3cFN
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 19:58:54 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id c30so1458671ljr.9
        for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V8fgBWB6Fwlc80DQzKSjfadMQq9+v7sFm69/tgJcyx8=;
        b=b+UduNbJq6kwMAPQgOSuaelsP440nPLKh4mZNI3OJpp2oPfpLd8jEkPyeaqxDaKLJu
         g2to7UoslpP80cXn6z2d3qsl+M/hHOAvRJNxZpCs24LeofPfHiZO5kHpvvjZIGxkidUt
         1depfTDbzezsOVlDTMpTQ5C0hPJXeIA5R5ddm522GuKkCuuweAHHWKKnTWzz1hMK3iUb
         4fatkiOpOUAXZLb1MLbF8mYVW6Bf7KtMWmyEzdGU0yfP+aqpDPVUWDs9bScFm+qRwCSI
         zrspBZcGZteC4lgw0N1VXd5yhxOfzhGrcnHTEKm31qag+MEqbBH4aYVq5EHw2vATzIGs
         07hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V8fgBWB6Fwlc80DQzKSjfadMQq9+v7sFm69/tgJcyx8=;
        b=vi4Yoy1BJ31fj4m2z4zezhEaHx5Rwsw1UBjtOXnpZLq9jzw1owqfj24oH/UsD6B8RM
         pYRIsQJwoYGHHpke7C+T6D3gXjJLABv/HGYfYd9g9NuylPgSIowQFXj8pTQG9IaiU6Y7
         TbV6XH/xZAdQKROU8tOOm/yuCn6mCKqSZgqc2ELDz4ny/WMFgBvN0RLhqoWzSTNHKeu9
         eAIuLN2y5JBAsLXOY48PBOX5iH1Oo/Cf0jZuKbZZEa8RVQ0mucnNM6apMXVnxL9b6Q2v
         J1YOfNjr8HzJZ49TCIhhM037B74kpm20N9W9IhHvmqZkxC0mmh+vkUm2S58fRR8mULY3
         AaLg==
X-Gm-Message-State: AOAM533xpAklMR1hJXedewrmxFYvjb0h3h+ZqvnGMZdZLcZG6DJYsyui
	GrNtkypAuI57SXwHXMPJ1Bo=
X-Google-Smtp-Source: ABdhPJwzkJ9Xi37kvu4X5cJKh8Gn6rL6I+HOKpwZclM9Wm2twJohgXGGrRlhPOPl63T2tv3oattPFg==
X-Received: by 2002:a2e:8686:0:b0:255:8474:f3af with SMTP id l6-20020a2e8686000000b002558474f3afmr20805147lji.402.1654941526941;
        Sat, 11 Jun 2022 02:58:46 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-90-154-71-254.ip.moscow.rt.ru. [90.154.71.254])
        by smtp.gmail.com with ESMTPSA id h18-20020a056512055200b004785060bad6sm200634lfl.201.2022.06.11.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 02:58:46 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 0/4] DTS changes for the AMD EthanolX CRB BMC
Date: Sat, 11 Jun 2022 12:58:24 +0300
Message-Id: <20220611095828.1090-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, aladyshev22@gmail.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, supreeth.venkatesh@amd.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Several patches for the DTS of the BMC on the AMD EthanolX CRB.

Konstantin Aladyshev (4):
  ARM: dts: aspeed: ethanolx: Add correct label to flash device
  ARM: dts: aspeed: ethanolx: Configure RTS/CTS for UART1
  ARM: dts: aspeed: ethanolx: Use correct driver for the FRU EEPROM
  ARM: dts: aspeed: ethanolx: Enable VUART

 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.25.1

