Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 760F4916CE7
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 17:25:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zPt753lM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7pYQ6RD1z3fVm
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 01:25:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zPt753lM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7pYL2qQhz3dDT
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 01:25:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF14CCE1BB0;
	Tue, 25 Jun 2024 15:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CE1C32781;
	Tue, 25 Jun 2024 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719329108;
	bh=9ATm6u9GQtzia4cO4CCanYRiBsUIMielL7YcNMryhKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zPt753lMCbNHYxxzeC9in8PKtzKv63K3kC1fbF7B7j/HbszDzpL/5KT6NYeM7IVTC
	 lVLKj0IQrkeotWxumBO2TKd9FsxsD8Qehd+RLw+NMXtOi0JQCNshB5o63yYqGcEIpL
	 jpTRlc7Vkic5fSTLgrBoX+MXbjIiiBBb9sLGSPLU=
Date: Tue, 25 Jun 2024 17:25:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v4] usb: gadget: aspeed_udc: validate endpoint index for
 ast udc
Message-ID: <2024062553-koala-granddad-50f1@gregkh>
References: <20240625022306.2568122-1-make24@iscas.ac.cn>
 <edeaa699-7cfe-44ed-abde-7cf3d3efe3bf@web.de>
 <2024062556-ladder-canister-1ab1@gregkh>
 <ff2aaf0d-5456-43d1-af52-78986b3401f9@web.de>
 <2024062532-strep-president-44d7@gregkh>
 <5fa430f5-3e18-4c20-93d4-6733afd6bdcf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fa430f5-3e18-4c20-93d4-6733afd6bdcf@web.de>
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
Cc: linux-aspeed@lists.ozlabs.org, Ma Ke <make24@iscas.ac.cn>, Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2024 at 05:20:07PM +0200, Markus Elfring wrote:
> >>>>> We should verify the bound of the array to assure that host
> >>>>> may not manipulate the index to point past endpoint array.
> >>>>
> >>>> Why did you not choose an imperative wording for your change description?
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc5#n94
> >>>
> >>> Markus, please stop reviewing USB patches.  This is not helpful at all,
> >>> and causes new developers extra work for no reason at all.
> >>
> >> How does this feedback fit to the linked information source?
> >
> > That is not what I wrote.
> 
> You indicated concerns according to patch review processes,
> didn't you?
> 
> See also:
> * Patch submission notes
>   https://elixir.bootlin.com/linux/v6.10-rc5/source/Documentation/process/maintainer-tip.rst#L100

This is not the tip tree.

> * Contributor Covenant Code of Conduct
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/code-of-conduct.rst?h=v6.10-rc5#n3

I do not see how this is relevant here.

> > I wrote, "Please stop reviewing USB patches."
> >
> > Please stop now.
> 
> I might be going to influence evolution of this software area in other ways
> under other circumstances.

Please take some time and find other projects to help out.

greg k-h
