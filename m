Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2098F265969
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 08:34:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnmFY0RrDzDqgF
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 16:34:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ThqJq/SN; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnmCw1Y8DzDqgZ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 16:33:15 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id i26so12228154ejb.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=bexmmLkEVLvYmN9pxp1Dmj7ZWctSoYRap9F4RxAw7DA=;
 b=ThqJq/SNW0q631CATdauAOvkNmmmzj5Vt2BJ2muSlp/jSKlnOELLii4xyc0P8hlY/j
 8T5KwVAcfEiXy/4ZpN9ZOYFEGI9o0pL2LnEYgrLAnZZIDgJaRIDK/92CnG7JmRDICXxb
 FG/eEjeMfNpMlq7PsP6AsqYwm0ZmTLnJ+JD6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=bexmmLkEVLvYmN9pxp1Dmj7ZWctSoYRap9F4RxAw7DA=;
 b=CprMbLlareKhmJXApYL8G024zOxTBBgvBiDw01cbYMIanjyoQyehhkJBvbPRO/X/Xk
 ybv3qJcsOQVWeKVnHztgrBlvq1MePkXLTaAV7xhdyG4XPJBvnWcMIn+ORhGyJ768JssV
 ufhK5IOXGQGu4zc4mT1Yef3ESHNVZD01DzeRiaxw9f+gGTQaautzgD2hL63sVvGDcHge
 fxGOCsY2vKNPLE0R3yl76rgGSecX21lvYnWE6l7xMAykyT8UEoynsUFr9D9RhCWgBCx9
 NfqkQYU1lvTiwdadGIxt+HqjRuSJDqo9ohaYLTtlDPDIwFC47vpAIz5+9HOQK9iSlggn
 UifQ==
X-Gm-Message-State: AOAM533eF1LdEU1Ita8zZjCKcFsyOjxwLxyjuJypnnqpPfti5vNlxu77
 G72DlcuyWnXNw3S4Fw5p8Lk5H4lSYEXr1KhgsiM=
X-Google-Smtp-Source: ABdhPJxpdTvT56ciOWYSGSFlDo49/DRe8t8Vy0BdHO6y3S5wfUpu91Huw2WsvNj7gxmA2nyc2p3tM5zJT5FdsOO5+h8=
X-Received: by 2002:a17:906:b6d5:: with SMTP id
 ec21mr575935ejb.396.1599805991496; 
 Thu, 10 Sep 2020 23:33:11 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 06:33:00 +0000
Message-ID: <CACPK8XdFE2K1_cyrg=uaD6CaOm_p0RCRmjAsu6uyFKD4rnDggQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.10
To: arm <arm@kernel.org>, SoC Team <soc@kernel.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Here are some ASPEED defconfig changes for 5.10. Please pull them!

The following changes since commit 74976e861309e4bf7f3e7e93f56ca3a6e0e1eca9:

  ARM: config: aspeed_g5: Enable IBM OP Panel driver (2020-09-11 15:25:24 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.10-defconfig

for you to fetch changes up to 74976e861309e4bf7f3e7e93f56ca3a6e0e1eca9:

  ARM: config: aspeed_g5: Enable IBM OP Panel driver (2020-09-11 15:25:24 +0930)

----------------------------------------------------------------
ASPEED defconfig updates for 5.10

 - Fix an issue with unwanted media drivers being enabled

 - New driver: IBM OP Panel, used on ast2600 systems. This requires
   enabling I2C slave mode

 - Enable I2C MUX GPIO driver

----------------------------------------------------------------
Joel Stanley (3):
      ARM: config: aspeed: Fix selection of media drivers
      ARM: config: aspeed-g5: Enable I2C GPIO mux driver
      ARM: config: aspeed_g5: Enable IBM OP Panel driver

 arch/arm/configs/aspeed_g5_defconfig | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)
