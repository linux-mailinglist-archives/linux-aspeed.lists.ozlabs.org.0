Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7A18CDB84
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 22:41:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=v5SIrry9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlfz55W18z87Dv
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 06:34:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=v5SIrry9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vlfyv1Y4dz87DG;
	Fri, 24 May 2024 06:33:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=izeBpVR9zkGYZYzcEzW+5qmgjUEU7HHob31bUa9JVsE=; b=v5SIrry9+IaF99OePM7YUdRyno
	cVsnEhHNr06WRsn3NW3lZXPn3htbxeR9HAUu6+CDRP+jAmogdmV5o1iUD5U/Th9lL7Oliw+sE2dfI
	x6nkflNw4E8ORRP3CMNmMdgBsn79rBkZD0FJ438NyPEhhtMQImA8vBHAqGnjWeMtKkJlEAd1R7tQi
	ek+ntVHCA9RYzp8MdYd07xm0rgABte/5PVRL9cBFude4gJiAmHofpkSCogAkWv7UXym/J1wPgbM5Y
	Aj+L4JCdSWpJ6X+BYhnUwdp4xiHAfp+89RISTbqoPXXfjBIKLr6yJXw3Hc7fUH8DzfFwFmwuz+0ga
	Uvu5+nEQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1sAF88-003rgV-03;
	Thu, 23 May 2024 20:33:40 +0000
Date: Thu, 23 May 2024 21:33:39 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Message-ID: <20240523203339.GS2118490@ZenIV>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <398bf753-6701-4925-b814-781a68a75cc5@web.de>
 <20240523-rinse-sturdily-7c78d8517884@spud>
 <d6289d1c-deae-49a3-9fc9-98a2f2e57802@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6289d1c-deae-49a3-9fc9-98a2f2e57802@web.de>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, linux-spi@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2024 at 09:46:48PM +0200, Markus Elfring wrote:
> >> Would you like to mention in the changelog that a hardware description
> >> should be extended anyhow?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n94
> >
> > You are talking absolute crap here. Stop harassing contributors with
> > your inane comments.
> 
> Why do you interpret my patch review contributions in this direction
> when the official Linux development documentation provides special advice
> on affected wording details?

Your "contributions" are garbage in general, and this thread is not an exception.
More specifically, you are picking an advice that is inapplicable, transforming
it into a question and "contributing" the result.

And your entire modus operandi fits that pattern - you spew random garbage and
expect the contributors to spend their time and efforts on checking if your
(contents-free) "advice" happens to make any sense.

That.  Is.  Worthless.

According to people who'd met you in person you *are* a member of our species,
and I can't exclude the possibility that in some other environments you might
be capable of sentience.  Unfortunately, the kernel development is clearly
not among those.
