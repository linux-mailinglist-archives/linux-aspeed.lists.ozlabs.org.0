Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90E84316E
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 00:41:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ivpu/CkG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPhWN3jDgz30fD
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 10:41:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ivpu/CkG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPhWH5zSWz3069
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 10:40:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A703061198;
	Tue, 30 Jan 2024 23:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369D7C433C7;
	Tue, 30 Jan 2024 23:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706658057;
	bh=Nx0CiS6ywPNVMOvWJqQQzTBmYRvePR93fgFNjSqYYgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivpu/CkGkLqC39CsG3MjaC2hHG7pbDn8WkrZYJK3iaqvehvw8Gm5VAVTKaIaZFb5I
	 0E+P/oJ4c77I+2CT9J0bwZSeGwWidTWCt0dZa96DXbPSscdQhAikOvShiH/cfNXRn5
	 NJe+DCa81BZcly21+sC4j1T45DI70NyfVGvxp6Fk=
Date: Tue, 30 Jan 2024 15:40:56 -0800
From: "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>
To: "Corona, Ernesto" <ernesto.corona@intel.com>
Subject: Re: [PATCH 30 1/7] Add JTAG core driver
Message-ID: <2024013050-humped-tibia-50a9@gregkh>
References: <LV8PR11MB846358B901CA67965197C4AB8B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV8PR11MB846358B901CA67965197C4AB8B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "'viresh.kumar@linaro.org'" <viresh.kumar@linaro.org>, "'linus.walleij@linaro.org'" <linus.walleij@linaro.org>, "'palmer@sifive.com'" <palmer@sifive.com>, "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'christian.gromm@microchip.com'" <christian.gromm@microchip.com>, "'zzyiwei@google.com'" <zzyiwei@google.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "Filary, Steven A" <steven.a.filary@intel.com>, "'rubini@gnudd.com'" <rubini@gnudd.com>, "Chen, Luke" <luke_chen@aspeedtech.com>, "'keescook@chromium.org'" <keescook@chromium.org>, "'arnd@arndb.de'" <arnd@arndb.de>, "'johan@kernel.org'" <johan@kernel.org>, "'vilhelm.gray@gmail.com'" <vilhelm.gray@gmail.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'Jonathan.Cameron@huawei.com'" <Jonathan.Cameron@huawei.com>, "'mika.westerberg@linux.intel.com'" <mika.westerberg@linux.intel.co
 m>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "'axboe@kernel.dk'" <axboe@kernel.dk>, "Luck, Tony" <tony.luck@intel.com>, "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>, "'rdunlap@infradead.org'" <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'pombredanne@nexb.com'" <pombredanne@nexb.com>, "Castro, Omar Eduardo" <omar.eduardo.castro@intel.com>, "'federico.vaga@cern.ch'" <federico.vaga@cern.ch>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jan 30, 2024 at 11:26:19PM +0000, Corona, Ernesto wrote:
> JTAG class driver provide infrastructure to support hardware/software JTAG platform drivers. It provide user layer API interface for flashing and debugging external devices which equipped with JTAG interface using standard transactions.

Again, properly wrap your changelog please.

And your patch series isn't even threaded, how did you send this?  Just
use 'git send-email' please.

> 
> Driver exposes set of IOCTL to user space for:
> - XFER:
>   SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
>   SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
> - GIOCSTATUS read the current TAPC state of the JTAG controller
> - SIOCSTATE Forces the JTAG TAPC to go into a particular state.
> - SIOCFREQ/GIOCFREQ for setting and reading JTAG frequency.
> - IOCBITBANG for low level control of JTAG signals.
> 
> Driver core provides set of internal APIs for allocation and
> registration:
> - jtag_register;
> - jtag_unregister;
> - jtag_alloc;
> - jtag_free;
> 
> Platform driver on registration with jtag-core creates the next
> entry in dev folder:
> /dev/jtagX

That's a lot for a single patch to do, please break this up into
reviewable chunks.

thanks,

greg k-h
