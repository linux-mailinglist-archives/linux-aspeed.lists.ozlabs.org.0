Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44946125B60
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 07:21:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dhbz3YnczDqp7
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 17:21:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="B1pvdwoL"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dhbh40FBzDqlY
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 17:21:36 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0B1C00F1A577DA89A48CEF.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:1c00:f1a5:77da:89a4:8cef])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 12A111EC0591;
 Thu, 19 Dec 2019 07:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1576736483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=steoryErl3lLrePbu9jWvjYCeP3FpAY53rDyYMrb8r8=;
 b=B1pvdwoLIo/ycXAo+zotyuEdABWv7Cyj8C1eOb62tARv8nZnZrRxzlXv94d3kt5KmRjgn/
 VfhYxGP4bLYWe0j/uy7+CFTrQ1vdoB8Bbs0eQG3gD6ViLTOamhGs7kJyj5FHPCYBoxMqaa
 hViiA1kbHG5UOB/hgA9TjOsRXrh1Zs4=
Date: Thu, 19 Dec 2019 07:21:22 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ma Feng <mafeng.ma@huawei.com>
Subject: Re: [PATCH] EDAC/aspeed: Remove unneeded semicolon
Message-ID: <20191219062122.GB32039@zn.tnic>
References: <1576735835-114453-1-git-send-email-mafeng.ma@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576735835-114453-1-git-send-email-mafeng.ma@huawei.com>
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
Cc: Tony Luck <tony.luck@intel.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Robert Richter <rrichter@marvell.com>,
 James Morse <james.morse@arm.com>, Stefan Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Dec 19, 2019 at 02:10:35PM +0800, Ma Feng wrote:
> Fixes coccicheck warning:
> 
> drivers/edac/aspeed_edac.c:246:2-3: Unneeded semicolon
> drivers/edac/aspeed_edac.c:255:2-3: Unneeded semicolon
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
> ---
>  drivers/edac/aspeed_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

https://lkml.kernel.org/r/1576648806-1114-1-git-send-email-vulab@iscas.ac.cn

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
