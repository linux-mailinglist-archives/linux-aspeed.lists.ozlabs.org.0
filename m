Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E69FE9C450
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Aug 2019 16:11:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GcVp5tc4zDqC7
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2019 00:10:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Nt1+7YFt"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GcVh5GtlzDq8W
 for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2019 00:10:52 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id 201so12127339qkm.9
 for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Aug 2019 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SyQPCPo5RRaBB/tZw0QQxTZ/KuTgWlGJeIl51xGbja0=;
 b=Nt1+7YFtAthX8FC4XmZF/HX+uvgq7g/fXtqFVHftkXDiGjLhziMTW4HXi9MPPbnXtp
 lxyuacPoVopJetmPKlIAF/HouWewlmdimZvf1kYCxgSIepib6SaDSEPeLP3yx01zIYRW
 XVZIQzCmj1GPy5ImdiRak222lw5pEeOV5KDrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SyQPCPo5RRaBB/tZw0QQxTZ/KuTgWlGJeIl51xGbja0=;
 b=Ty8Sc3t1FSO/DKaofSy3B4brog2V6BnkccQFwBeH0V/af0sIHzHA+SOr+YrhvwEjg9
 MuU6hOs2ExbsW+5MtEenl+QLCOUW6rROXvbY7DcSUverddn7BQXH807XW/ey52j91ERK
 F/DjEKFV6ydu+2o6mVumI2bxKwRox5aPGFC4g/JwyIDWgBnVBePnsiU/0/2nbu/BN+rQ
 o6EHh7yPEVMdo7dFRWzfY0q+LBvzgHeelOUEsVKX2sICaYitI2CoYtP55oKbaZ3IXGiA
 NaMK9iCZA9H4oEEtjlbTULc8hJT/7AXaZI3Jth7WPSBzZR0Ng31D0nV0+pYbWnDZHo8Z
 SA/g==
X-Gm-Message-State: APjAAAUWJmaMBpER1jeHeUHe0HS9IiTpvLzUzzDLFnrtop7y4Wzjvwlb
 iFHsd6i//EQimEo41gWDyEI6LSW8AvAedf5XgSc=
X-Google-Smtp-Source: APXvYqzCShrBbnLD0I8IGPZMUfLXTDOJd2ECnf5hkfsCppiBA2GH4tFCp/bgmUFf3qmBfIXjG2dTD5ovD8WONQHjm44=
X-Received: by 2002:a05:620a:70f:: with SMTP id
 15mr12442213qkc.171.1566742250111; 
 Sun, 25 Aug 2019 07:10:50 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 25 Aug 2019 14:10:39 +0000
Message-ID: <CACPK8XdyWzghA0QPDzA_MK5FYwhT5afqDJHNdhc8mfD2uk8MfQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.4
To: arm <arm@kernel.org>, soc@kernel.org
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello ARM Maintainers,

Some bits and pieces for the defconfigs. The multi_v7 one applies to
linux-next with a bit of fuzz, but let us know if you run in to any
issues. I'll be away for this week, but Andrew will be on hand to help
out.

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
   tags/aspeed-5.4-defconfig

for you to fetch changes up to 4cdabee7d6d2e439fea726a101e448c4ca6837f4:

  ARM: configs: aspeed_g5: Enable AST2600 (2019-08-25 23:22:54 +0930)

----------------------------------------------------------------
ASPEED defconfig updates for 5.4

 - Enable the new AST2600 in multi_v7 and the aspeed_g5 configs.

 - Regenerate defconfigs to drop old options

 - Clean up network options

----------------------------------------------------------------
Joel Stanley (3):
      ARM: configs: aspeed: Refresh defconfigs
      ARM: configs: multi_v7: Add ASPEED G6
      ARM: configs: aspeed_g5: Enable AST2600

William A. Kennington III (1):
      ARM: configs: aspeed: Enable commonly used network functionality

 arch/arm/configs/aspeed_g4_defconfig | 50 +++++++++++---------------
 arch/arm/configs/aspeed_g5_defconfig | 68 ++++++++++++++++++++----------------
 arch/arm/configs/multi_v7_defconfig  | 19 ++++++++++
 3 files changed, 78 insertions(+), 59 deletions(-)
