Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDCB678
	for <lists+linux-aspeed@lfdr.de>; Sun, 28 Apr 2019 22:19:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sfK93qhHzDqP9
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 06:19:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::144; helo=mail-lf1-x144.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="Q+HzDHwx"; 
 dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sfJv1lRqzDqCV
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 06:19:21 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id h18so6192783lfj.11
 for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Apr 2019 13:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uESuT2/vnwdwZQtp15hl2eU9W6ZryEUdBWnC24mtDbc=;
 b=Q+HzDHwxmu2t+8UWUOpHwnDONDplN9zUqvzAzbjCZ1R+PE+3t5XDGMRnMQfUDDTxr1
 c8qERfMdevNSqJHiwM65qqCV47diHE0enbGZL1sKCsW+6NBNXDnrn4zVTSo8zqW5QjcX
 H1gd3dJnaKgU//Q4WdplAp2RxsV77Ddoh2pVZwSAU5vcvXFJc+MBiGKo7IxjiOOA2NbG
 J7suF0cl/fqWSXWUPMcsS2GHYI5Dg89gtPpQ5k7Lg9TtUc/+KzmUinLtyQVUwzgVOS/+
 oPyhaPB+jXdYGmimTR+dT3r8HVZhMudeCdMSRrjIJtA4GClnmHMAIGgQMB7k64KycBS/
 Xp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uESuT2/vnwdwZQtp15hl2eU9W6ZryEUdBWnC24mtDbc=;
 b=QowBxngJVbzTRkhSCaWJULRHmSOVeUpbG+8zvVUz5GdgjJf7GrIhJbcYwHS770lLu1
 9JDeh7gkNQL85+mzq2N36mf981MvKWGlqYQjx9qA32DmAMmlLKVQA6DlU1GPnNV0LIW2
 TDMMIbyBpmQ8Tokw8AboTpN17dx43UhVzhQ8K+zA8bU3OX3y7B5bhkG7pC/+NaJotMBD
 bvYC5Nl3zUDbmba9yKlJV2hCyfft4xuHvu3N4hITWq9hbp5FSrsCREBwZiHF0zKyBby9
 syLC7Oqkn9BCVHO8Z/94RCYxg8mjgY75U9Nc2kY8HJ70AvPA3O/xAj47PO9QhS+fxscL
 HWFA==
X-Gm-Message-State: APjAAAWWX3r0XxqVjm+kUBKmbbDfUycqZ0Dr7b5Jn8BeuraCcQh21/aQ
 YEUsGqXwKbacG1VA5SEJ/pL+8Q==
X-Google-Smtp-Source: APXvYqzf+yLJ2dbX/Ee+19ZL31b583qb9g/WwsfcQOKRLKlLHvm8pYB//8DO/eSB3B2QQ+2A/KK/IA==
X-Received: by 2002:ac2:51da:: with SMTP id u26mr30416845lfm.32.1556482758253; 
 Sun, 28 Apr 2019 13:19:18 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id p19sm6943032lfc.48.2019.04.28.13.19.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Apr 2019 13:19:16 -0700 (PDT)
Date: Sun, 28 Apr 2019 12:17:21 -0700
From: Olof Johansson <olof@lixom.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: dts changes for 5.2
Message-ID: <20190428191721.v76bkirt4tiufnfd@localhost>
References: <CACPK8XdevZ9LHtVVu=fHbTxSKfDugym3jT0ueKEpa9qhLYbFnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XdevZ9LHtVVu=fHbTxSKfDugym3jT0ueKEpa9qhLYbFnw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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

On Fri, Apr 05, 2019 at 03:47:38AM +0000, Joel Stanley wrote:
> Hello ARM Maintainers,
> 
> Here's the first ASPEED device tree pull request for 5.2. There might be a
> second one later as I pushed out a pair of patches for review today.
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
>     tags/aspeed-5.2-devicetree

Thanks for easing copy-paste!

> 
> for you to fetch changes up to 6d00c6f8d2e781e3c821fc9c614f404cc981804d:
> 
>   ARM: dts: aspeed: Add RTC node (2019-04-05 14:08:20 +1030)
> 
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.2
> 
>  - RTC and GFX DRM driver went upstream this cycle
> 
>  - Miscellaneous board updates for Facebook and IBM BMCs

Merged, thanks!


-Olof
