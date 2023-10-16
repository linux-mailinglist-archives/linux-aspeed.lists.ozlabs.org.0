Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC487C9D0D
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Oct 2023 03:48:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EBiSVi3F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S80Q735wqz3c2L
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Oct 2023 12:48:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EBiSVi3F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S80Pz74X4z2xpx
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Oct 2023 12:48:39 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ba081173a3so652501066b.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Oct 2023 18:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697420916; x=1698025716; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MaAz3IyOUXaHfkCb9M3TM3RU1HBndDh170iebIaArlA=;
        b=EBiSVi3FIu1sIGkuvTv9z1XS2ZtxdvBp8jiwcNRDsFr8kqBNmyaig45lcHqd8u98dQ
         atpfc8pzN+RBKSl1BNG/d20gPUHqEhKYrcHL60Z/cI39NSwdg4h65DUWy/8wki+IXChO
         BhD/O3A37YCBTyPagD41YJsWS+tC/pV52NiPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697420916; x=1698025716;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MaAz3IyOUXaHfkCb9M3TM3RU1HBndDh170iebIaArlA=;
        b=ZWjr/pxnrJuSxHGzMv7OuBxksi47BnhJQxe7A/aZZruyjWToZuciuCru/YFofCNiHl
         tUFA3H0bfmif6kHYcuvU64avS8j82XR1ljvBM7pc6UQcDK40uQ2PrM9DKOEkN0CXYv3p
         RKSBSkKl28U3ZGSEuQK40KSId9/h1TyEStZGHS2+0f7yUe9FMj9tzLxYE6bHvZMGFc7z
         2jpERjyayanDu2egMlx30CYKAkjOYbBRMvJlpk4DTO8C7mi60BtR9D3iwvWi56AYiN1T
         SfEwyS8ZewsZLdRvI07jFumx5/tMhOzhjR8afpDhXdfdhtRObQPTPnbs/wRtQUANh6HS
         5KeA==
X-Gm-Message-State: AOJu0Yxn7IgevirShiqgtuhzJ6oq8MJMMWW2+e+dh76Aahfj977Y5val
	MhIWowoOeAaNwgi1RU4GrcnACkHgbf/w2oYMC25qbLvE69A=
X-Google-Smtp-Source: AGHT+IHEGjJacXRMU1XLaZB2mREtkfdGJtVOmgfTvoTxAq6OGMOerGwL0+89Rjxow8S2w/zOEOF1mMDJx/Mod++P2KI=
X-Received: by 2002:a17:906:99c2:b0:9be:7b67:1674 with SMTP id
 s2-20020a17090699c200b009be7b671674mr5282372ejn.3.1697420915880; Sun, 15 Oct
 2023 18:48:35 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Oct 2023 12:18:24 +1030
Message-ID: <CACPK8XezpL-4bx0S-9t999_qde5Hik9BnuUZHcnmDHTd0KWBLA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 6.7
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello soc maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.7-defconfig

for you to fetch changes up to f1538805cf9da7a1be38c78690a0d3809e330acd:

  ARM: config: aspeed: Remove FIRMWARE_MEMMAP (2023-10-13 14:56:11 +1030)

----------------------------------------------------------------
ASPEED defconfig updates for 6.7

 * Enable SMPro and FSI drivers, the BMC to host interfaces for Ampere
   and IBM's server processors
 * Enable IPMI SSIF, the smbus transport for IPMI
 * Disable FIRMWARE_MEMMAP, an x86 only thing

----------------------------------------------------------------
Joel Stanley (4):
      ARM: config: aspeed: Add new FSI drivers
      ARM: config: aspeed: Add Ampere SMPro drivers
      ARM: config: aspeed_g5: Enable SSIF BMC driver
      ARM: config: aspeed: Remove FIRMWARE_MEMMAP

 arch/arm/configs/aspeed_g4_defconfig | 1 -
 arch/arm/configs/aspeed_g5_defconfig | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)
