Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377F2CD04C
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Dec 2020 08:21:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmnLk6HBMzDr7l
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Dec 2020 18:21:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=msXBd46p; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmnLS61J1zDr34
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Dec 2020 18:20:47 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f0dc500db287c99eb312af4.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:c500:db28:7c99:eb31:2af4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8DC211EC04DD;
 Thu,  3 Dec 2020 08:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1606980035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=I5tjK7vXmcH6KWOR2osK2BTeMN2+voSuUMYTgYKLvz0=;
 b=msXBd46puOaaytgd7Vpo+UMF4g38wyPtzFZ9umpdp8RwrpSg80sdCQz5CAXKGOw1n1kVik
 LG5rNZzvDonZnXLLw/sjDRO+LseOSwsI/ELsDEjxlPRJsHBVDdwEjSBwD821UhfhV1iHQd
 EdZI6USOuyOb7ZCuwemKgbVnmGPRTiY=
Date: Thu, 3 Dec 2020 08:20:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v2 3/3] edac: Supporting AST2400 and AST2600 edac driver
Message-ID: <20201203072036.GB3059@zn.tnic>
References: <20201202063612.21241-1-troy_lee@aspeedtech.com>
 <20201202063612.21241-3-troy_lee@aspeedtech.com>
 <CACPK8XcBTm8-cAPmtswHbYAf2B+PdBiZ2s1XK1UqKA_NQX_-mw@mail.gmail.com>
 <PS1PR06MB26008E4BCB805553EDEC45038AF30@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <b6dd3a91-abe7-4e9d-b801-6e54e4c88827@www.fastmail.com>
 <20201202182349.GJ2951@zn.tnic>
 <PS1PR06MB2600D6A1E73D89EA0D0D59DC8AF20@PS1PR06MB2600.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PS1PR06MB2600D6A1E73D89EA0D0D59DC8AF20@PS1PR06MB2600.apcprd06.prod.outlook.com>
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

On Thu, Dec 03, 2020 at 01:27:27AM +0000, Troy Lee wrote:
> Hi Broislav and Andrew,
> 
> I removed these exported function and submitted v3 PATCH.

I saw that. A couple of comments:

First of all, please do not top-post on a public mailing list.

Secondly, Joel gave you Reviewed-by: and Acked-by: for your patches 1
and 2 which are not in your new submission. But they should be, please
have a look at Documentation/process/ while you're waiting for his
review of your v3.

You don't have to resend now with those added and I can add them if Joel
is fine with patch 3 but pls remember to pick up tags reviewers have
given you, in the future.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
