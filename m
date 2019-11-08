Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD1F538C
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 19:33:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478pmf6HJfzF4R0
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Nov 2019 05:33:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="lcHEVb7Y"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478pmW2CQkzF3TD
 for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Nov 2019 05:32:52 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id y6so5207402lfj.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 08 Nov 2019 10:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lToQqnmkEE+3h6EKSzEwHbEtxzI5gjkHTGGJ/R6Ms+g=;
 b=lcHEVb7YckDXFfsmujq+tBplhDyXzSN17INAzOfQUCVo3wTMQva3RP33Xv9nXfYBxj
 h9bmKM1uYwL0kEB90uo05qupp97MNVFoB7zExHvF7mfvHs4mBBm7M8zWldoEESN1YyC4
 MQ81ugyUzIuLEIjXNFXsahBEic25PtkbR7okMliSY8qgXmSFSNUYczVE9p+PmXgmJ8vw
 FUbuQlLTfSgBv2/vNNj+v3hPgE5uOfygOBJQNMVySJXjiDSRCu4pWYpN4vBdJ7Z667u5
 Rk6z69XyC03d6zqJ6hN/5EsJP9CjmqjCkbg/blKjmjznqTwdwyvVLQ+6Ni2ddgeFedvm
 Anfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lToQqnmkEE+3h6EKSzEwHbEtxzI5gjkHTGGJ/R6Ms+g=;
 b=iG5i4YHdfGTqDqeEEcEkwCmFBxxZFDUfJtfWkw5/7tGJGBfpE3N6+zbkBhp3nlicOU
 sy0jslboHUVl/v76OwNrNRDooWokyzdxxuYcd1ho6tyXXF2xFsvTJDLcfdzqC+wIcgXf
 OeRix3sssaiZamthwZz6uWmXC+65BMauJKuuC2jvX6QU8hUXA1O9EsDRNDQWlL/X+URb
 ccIvaDowPF6i8W2Qlk0psq8jckxUOgObfmDJgtRTRAlfSyHmNU3kqpyKDxBqgjz7sw1F
 oA6VWxS5Jiqt0+17B2+QyNTH7Zm3KbegY0+4M7BRY1aU9gcM35+N9KDzY5alCdszDt+r
 B57w==
X-Gm-Message-State: APjAAAXR2+W4tSj1tHrtcNo+DZAbIs5hp/UEJCC8bL7vXkodAO//nJzO
 FrVmvNHPRLJHE/eutKi3MmPiwl9HHMSfXw==
X-Google-Smtp-Source: APXvYqzRjRBxuTT8nQICr11eg231/AYdCsmsmBFd6/CQVulerzD2GhqHzkUb29FSzv7DhmLAnynRQw==
X-Received: by 2002:a05:6512:40e:: with SMTP id
 u14mr7666027lfk.73.1573237967355; 
 Fri, 08 Nov 2019 10:32:47 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id g7sm2915256lfb.4.2019.11.08.10.32.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Nov 2019 10:32:46 -0800 (PST)
Date: Fri, 8 Nov 2019 10:31:24 -0800
From: Olof Johansson <olof@lixom.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.5
Message-ID: <20191108183124.r2wdql4rmdbzx2up@localhost>
References: <CACPK8Xe8XiJ+oEp3_AXO5Mox-mXWVrOJKQLJMKJxg1WdYCTzMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xe8XiJ+oEp3_AXO5Mox-mXWVrOJKQLJMKJxg1WdYCTzMw@mail.gmail.com>
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
Cc: soc@kernel.org, arm <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,


On Thu, Nov 07, 2019 at 11:18:10AM +0000, Joel Stanley wrote:
> Hello ARM maintainers,
> 
> Here's the ASPEED dts tree for 5.5.
> 
> The following changes since commit 3eca037f2dfce07a31da0a837ac35d6d846614b0:
> 
>   ARM: dts: aspeed-g6: Add timer description (2019-11-07 21:23:56 +1030)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
>     tags/aspeed-5.5-devicetree

This is a weird format. Mind changing your script to not put the '\' at EOL?
It's messing up the parsing scripts, and git doesn't use it.

> for you to fetch changes up to 3eca037f2dfce07a31da0a837ac35d6d846614b0:
> 
>   ARM: dts: aspeed-g6: Add timer description (2019-11-07 21:23:56 +1030)
> 
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.5
> 
>  - Lots of work on the AST2600 boards as bringup continues. There's the
>  eval board, and two IBM boards called Tacoma and Rainier
> 
>  - A new flash layout for OpenBMC systems with larger flashes
> 
>  - Better support for the MAC clocking when talking to a NCSI device,
>  making Linux less reliant on u-boot having done the correct thing
> 
>  - LED fixes for vesin and fp5280g2
> 
>  - SGPIO support
> 
>  - Facebook network BMC cleanup with the common hardware moved to a
>  shared dtsi
> 
> ----------------------------------------------------------------

... also, there's no shortlog and no diffstat on the pull request. We usually
want to see those.


That being said, I merged this branch. Thanks!


-Olof
