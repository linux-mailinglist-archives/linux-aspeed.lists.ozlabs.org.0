Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C512CC4F5
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 19:24:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmS6Y4vjszDr9w
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Dec 2020 05:24:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=eyF7oJ8j; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmS6Q0YqwzDqTd
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Dec 2020 05:24:12 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f161b00329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f16:1b00:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7193B1EC04DB;
 Wed,  2 Dec 2020 19:23:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1606933433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=4K5oryCh4lYprceHfJITgYNxkJkNbvO0oAmzKtsMskk=;
 b=eyF7oJ8jzZXnSjEQtaZrUqi4mwuWKRWOIW9O8LaGm8MqDGJY2ivCpGoIYOt1Z6+twhPWwg
 BD27rstCZtNJappHLb/XnRJL/bLtkDIm1ccUAtRxsnvNQZrxM7nK48jtE06jmDLK5BhWQv
 ogqK7rU9rqVC++YIVNJfV+c9klFxF94=
Date: Wed, 2 Dec 2020 19:23:49 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 3/3] edac: Supporting AST2400 and AST2600 edac driver
Message-ID: <20201202182349.GJ2951@zn.tnic>
References: <20201202063612.21241-1-troy_lee@aspeedtech.com>
 <20201202063612.21241-3-troy_lee@aspeedtech.com>
 <CACPK8XcBTm8-cAPmtswHbYAf2B+PdBiZ2s1XK1UqKA_NQX_-mw@mail.gmail.com>
 <PS1PR06MB26008E4BCB805553EDEC45038AF30@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <b6dd3a91-abe7-4e9d-b801-6e54e4c88827@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b6dd3a91-abe7-4e9d-b801-6e54e4c88827@www.fastmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tony Luck <tony.luck@intel.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "leetroy@gmail.com" <leetroy@gmail.com>, Robert Richter <rrichter@marvell.com>,
 James Morse <james.morse@arm.com>, Stefan M Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 01:32:44AM +1030, Andrew Jeffery wrote:
> On Wed, 2 Dec 2020, at 19:11, Troy Lee wrote:
> > Hi Joel,
> > 
> > Thanks for the suggestion, I'll fix the review and create an new patch 
> > against 
> > latest Linux branch. Those exported function will be referenced in 
> > other driver yet 
> > to be upstream, so should I move those exported functions out of this 
> > patch?
> > 
> 
> Yes, let's leave the exports out of this patch, and add them in when you send 
> the patch that depends on them.

And when you do, almost all new exports are EXPORT_SYMBOL_GPL - not
EXPORT_SYMBOL.

Also, I'd like to see how those exports are going to be used. An EDAC
driver function exported to another driver sounds strange. We have only
one other case like this in the EDAC tree:

drivers/edac/amd64_edac.c:554:EXPORT_SYMBOL_GPL(amd64_get_dram_hole_info);

and even that is not really needed...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
