Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FAC55014
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 15:18:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y6Db6fFbzDqMd
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 23:18:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="xAhrWmo8"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y6DP5X5QzDqGl
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 23:18:27 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id k20so547894ios.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 06:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A6UAI9WWXMf2Qu6aM/WVg80wL6CqlBhaWrohoeZmtwY=;
 b=xAhrWmo8R0p5m/XEwvf6mtW/z8H8tn6MSTYxZaMaqVGrFku4+Apv9I4W7entyO6YKw
 NcT3WTvRI7zN8WPcExzGBVU2Hw+91ynNggAOxCYsjXVD78JR2AU4wsca6qIllAk5T3OC
 1LvD0CjSDWukhZHBytLAOG3zTKw+NuvBtiO4rhTZM8mA1wBWksMIvNT2+I1wkJRDPZKU
 sGyllvg6ayS+UObypUBlmd4RrGA3VHjrwlHE05/pNemZLitqyxgHABOoV3ywisJ8GshW
 EjK0+jd1UiycJ0hFt3J+3kRjVemnTv8FV7oBSjNMwvTj89fgHKRHHSel6vdCfzEYyTbT
 Cl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A6UAI9WWXMf2Qu6aM/WVg80wL6CqlBhaWrohoeZmtwY=;
 b=ugJhvIOJ2Svk3IQVBMp53k0hQiDd9eiBMxfOd9MH2HffqQ87znB2zxVYofzOpjmZ86
 dUbGeXdVfFB79xk0nEsWjJxslgg1t0Nl32zBhPw+viyGhXQGsdHWyH1spwtifVkhZ/Tv
 Qw+dQPpperccBL2wQ366P9TJTQkSpV/TJKf2YAr6HzLWua1/N5GDAv3jByvJDAlHBXxI
 saM2J73bN+kZhh/uaZ7D1qNrasyKCp/JA0hssyo4vF+0CeTfuW2KWGIVQgGELO/3+3z7
 b69/+WrnlHidoyJl5KBL0F1+buQlhmEpAT5bk2dO8ShLrmeZMBJ7H5OsYzyCgkaXtVhM
 W2YA==
X-Gm-Message-State: APjAAAUseYuYqxKbofMkUyNJxKD2rwOW33b9ofKdxGRaeUS+MHyx6jwh
 69lG2fPCbFlvUD8fplDy8dgE6WQzX8soWwYw8Lne14nXahBsYA==
X-Google-Smtp-Source: APXvYqyvlNjne1jPy/BR9Wol/QJjFW5FsU51KCX3hS+df+11wY57vr0sqJtArQCmjQj/hDYaatXVG/kKPLLuG9Af2lI=
X-Received: by 2002:a6b:1494:: with SMTP id 142mr17350276iou.72.1561468703231; 
 Tue, 25 Jun 2019 06:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XfL-U-BeynGQNBp5rPiv1gzD=7DVzyvrgtoL3njU1Kr_A@mail.gmail.com>
In-Reply-To: <CACPK8XfL-U-BeynGQNBp5rPiv1gzD=7DVzyvrgtoL3njU1Kr_A@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 25 Jun 2019 15:18:11 +0200
Message-ID: <CAOesGMjTBazjfMYEKww_dGuFAZYa7f6JBZDoyyCNaWKvKdpbQw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: defconfig changes for 5.3
To: Joel Stanley <joel@jms.id.au>
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
Cc: arm <arm@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

Looks like the multi_v5_defconfig changes aren't producing the results
you're probably expecting -- unless the drivers are pending in
linux-next?

arch/arm/configs/multi_v5_defconfig:257:warning: override: reassigning
to symbol ASPEED_LPC_CTRL
arch/arm/configs/multi_v5_defconfig:258:warning: override: reassigning
to symbol ASPEED_LPC_SNOOP


-Olof

On Sat, Jun 22, 2019 at 9:59 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hi ARM maintainers,
>
> Here are some defconfig updates for the ASPEED machines. I haven't
> sent one for a while, so there's a nice collection of drivers to add.
>
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
>     tags/aspeed-5.3-defconfig
>
> for you to fetch changes up to 2d8bf3404bb0e65dffb7326f7fb6e96fa3cee418:
>
>   ARM: configs: multi_v5: Add more ASPEED devices (2019-06-22 17:12:17 +0930)
>
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.3
>
> Add new drivers to the ASPEED G4 and G5 defconfigs, and to the armv5
> multi defconfig.
>
> ----------------------------------------------------------------
> Joel Stanley (2):
>       ARM: configs: aspeed: Add new drivers
>       ARM: configs: multi_v5: Add more ASPEED devices
>
>  arch/arm/configs/aspeed_g4_defconfig | 10 ++++++++--
>  arch/arm/configs/aspeed_g5_defconfig | 14 ++++++++++++--
>  arch/arm/configs/multi_v5_defconfig  |  8 ++++++++
>  3 files changed, 28 insertions(+), 4 deletions(-)
