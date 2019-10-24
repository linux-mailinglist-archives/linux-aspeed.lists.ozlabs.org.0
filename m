Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 771DEE3499
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Oct 2019 15:45:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zT675CdlzDqQH
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Oct 2019 00:45:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="Of9iK+Js"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zT5x4CNNzDqPW
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Oct 2019 00:45:41 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0F6D006C14721BC32EDA46.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:6d00:6c14:721b:c32e:da46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 62C761EC0CB2;
 Thu, 24 Oct 2019 15:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1571924719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ZDDiIZV3N/1CCiWoHasK1HUYfVsvlhqlkoWiG1CA6ws=;
 b=Of9iK+JsmYNONFtkeLUj9egCEHJpdvzCfczMFWtS3SdEVJQxU8uZqj3e8xgaMRKMikxKsf
 SJ5k3neCBb/U7AEz9snyj06KhRrwswAPd2pZjSveI/Wend8ho72MXkzdeo/tLbKrb0AxL3
 DMbvcueT96ApYV6uTfXPCcXaflemDkE=
Date: Thu, 24 Oct 2019 15:45:11 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] EDAC: Aspeed: Use devm_platform_ioremap_resource() in
 aspeed_probe()
Message-ID: <20191024134511.GA1942@zn.tnic>
References: <baabb9e9-a1b2-3a04-9fb6-aa632de5f722@web.de>
 <CACPK8XfUJ5VGpTS3gwxSVZbdWZKPH6PwT2JKGGJ2yzoXYKdtZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACPK8XfUJ5VGpTS3gwxSVZbdWZKPH6PwT2JKGGJ2yzoXYKdtZg@mail.gmail.com>
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
Cc: Tony Luck <tony.luck@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@marvell.com>,
 James Morse <james.morse@arm.com>, Stefan Schaeckeler <sschaeck@cisco.com>,
 Markus Elfring <Markus.Elfring@web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 06:23:53AM +0000, Joel Stanley wrote:
> On Sat, 21 Sep 2019 at 16:47, Markus Elfring <Markus.Elfring@web.de> wrote:
> >
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 21 Sep 2019 18:32:46 +0200
> >
> > Simplify this function implementation by using a known wrapper function.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Acked-by: Joel Stanley <joel@jms.id.au>

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
