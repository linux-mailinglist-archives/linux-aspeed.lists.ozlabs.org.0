Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B07EC2826A1
	for <lists+linux-aspeed@lfdr.de>; Sat,  3 Oct 2020 22:32:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3dns58KMzDqQF
	for <lists+linux-aspeed@lfdr.de>; Sun,  4 Oct 2020 07:32:17 +1100 (AEDT)
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
 header.i=@lixom-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=qhCyCGPd; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3dnM2qtFzDqPQ
 for <linux-aspeed@lists.ozlabs.org>; Sun,  4 Oct 2020 07:31:49 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id y11so6219201lfl.5
 for <linux-aspeed@lists.ozlabs.org>; Sat, 03 Oct 2020 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MZ3TCdgtWOV1cpcxI3RDfFAiO252gsiZlfrLaESlfTE=;
 b=qhCyCGPdsXpceShgj7b+dnQN/0Uj2Dl8jNpza/nnIicaPXI0qgndQFKnDZISgSTWyE
 hlKjSygmNvU4kPeJMzgNM+Be0ZPdcM5SIZBNY8TXo0MHP5evUMYTYityBg8a3uSMfdbX
 AeFrAgVTGAzzvVwemaGWaxuWbWfiOTTd7R0KKeWblzrgcvzIBMfPZ7bQN8UzrG/Br9Fs
 LlERv0CZpsbEVFVIXBjT/EfUSEFCv+dHAEcaJ9HA8mbFzPqwEh0sucG1OX6E54omoERL
 hF2qVke2gR1oCBuQGMIeE/CK9XOhFH7NuoT9DACA4GQZdDb3lalT1HCjzPqRDtr61EJJ
 uQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MZ3TCdgtWOV1cpcxI3RDfFAiO252gsiZlfrLaESlfTE=;
 b=ITR64Tp4tSvxpfZRi6c/RrH0FpifKP9bHhLO1o6ZOT+L7QWJBuj+NSQCGlYwSgMPL5
 jM2+4xSAPqI3NPI/gL/ySIvJ//JjUcAYzCbGKqSgJUHWksyjvh+sSLxGcB0VJgBpyVZX
 EVI5pZyJbLZAvwBdSaHq1jGlX/xoJGMTFlh3Mq1ssWSJ/NyiOXD6GzJ8NRyzOxS1fHlD
 gJPtQY7DWN4b7p7Wobx6DVvbqc62NDrw+pZeQXFBAl8Kt8pkQUqvOg0r1jo9gLdmSRlo
 c0fqtycgkWeC+m2oX2ps4xJICnvOXGStO+ExWFaBzQfGEzvYOlJaDlVJPG2pa7dy1VA7
 LX4Q==
X-Gm-Message-State: AOAM533VPRU6qvFKV0qnHPhPLhPAKsX7F7JeD5JBh1uLKQj2YVoyJynD
 DfsGZMRfaVUvbsp1l/2W5DvA/Q==
X-Google-Smtp-Source: ABdhPJxZKZugeehC98WN6pvorkHtEwEuivSXGox7is3DAiNTkVy8yOLZpegBepf59Ged51b5nO+igg==
X-Received: by 2002:a19:6b17:: with SMTP id d23mr3219970lfa.190.1601757104287; 
 Sat, 03 Oct 2020 13:31:44 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id o15sm1842335lfo.188.2020.10.03.13.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 13:31:43 -0700 (PDT)
Date: Sat, 3 Oct 2020 13:13:52 -0700
From: Olof Johansson <olof@lixom.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.10
Message-ID: <20201003201352.GI8203@lx2k>
References: <CACPK8XcP_j7q+jWN6_JGaEcfPy=zSQHyizp1LOw05zFB4L9iGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcP_j7q+jWN6_JGaEcfPy=zSQHyizp1LOw05zFB4L9iGQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, SoC Team <soc@kernel.org>,
 arm <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

On Fri, Sep 25, 2020 at 06:31:28AM +0000, Joel Stanley wrote:
> Hello Soc maintainers,
> 
> Here are some ASPEED changes for the 5.10 merge window.
> 
> The following changes since commit e55f541e51b5136fc0ced0bdf2b33ee3cca3bc96:
> 
>   soc: aspeed: xdma: Add reset ioctl (2020-09-25 15:32:57 +0930)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> tags/aspeed-5.10-soc
> 
> for you to fetch changes up to e55f541e51b5136fc0ced0bdf2b33ee3cca3bc96:
> 
>   soc: aspeed: xdma: Add reset ioctl (2020-09-25 15:32:57 +0930)
> 
> ----------------------------------------------------------------
> ASPEED soc driver updates for 5.10
> 
> New drivers:
> 
>  - XDMA driver for the BMC to host PCIe DMA device

I don't think this driver belongs in drivers/soc, it's not "soc glue
logic", and it has a userspace interface. Some of the commits even
references it as a "misc driver". Mind resubmitting it for drivers/misc
instead?


Thanks,


-Olof
