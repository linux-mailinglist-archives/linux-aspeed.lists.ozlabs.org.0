Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B875E84316B
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 00:39:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=clQj8Yvd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPhTQ4hchz3bqx
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 10:39:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=clQj8Yvd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPhTK5whdz3069
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 10:39:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31D5361170;
	Tue, 30 Jan 2024 23:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8BAC433F1;
	Tue, 30 Jan 2024 23:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706657954;
	bh=SWhI9SxUKhbmDM6VC3Ww/o/zAc3CMboKSmdOI2DEQUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clQj8YvdIRqfCZ71/YLjXkrbQeN1jJ6hp51k9LHxlbTRd0euaSHP4YVjz+GWbmr49
	 4VCVabrAjew0rJS11xyeUvCMENFvk2FtYAMKbM+jA6I4XQQXddgwLksUeGfHT5+iPQ
	 CepZ8/u1RO367Ydon9G8AcpGK+hEBtcq5ViW4WdQ=
Date: Tue, 30 Jan 2024 15:39:13 -0800
From: "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>
To: "Corona, Ernesto" <ernesto.corona@intel.com>
Subject: Re: [PATCH 30 5/7] Add JTAG core driver ioctl number
Message-ID: <2024013024-starship-referee-7ab3@gregkh>
References: <LV8PR11MB84634960758E20E781DB638F8B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV8PR11MB84634960758E20E781DB638F8B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
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
Cc: "'alexandre.belloni@bootlin.com'" <alexandre.belloni@bootlin.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Filary, Steven A" <steven.a.filary@intel.com>, "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "'sandeen@redhat.com'" <sandeen@redhat.com>, "'lorenzo.pieralisi@arm.com'" <lorenzo.pieralisi@arm.com>, "'corbet@lwn.net'" <corbet@lwn.net>, "'ebiggers@google.com'" <ebiggers@google.com>, "'kishon@ti.com'" <kishon@ti.com>, "'bryantly@linux.vnet.ibm.com'" <bryantly@linux.vnet.ibm.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "Chen, Luke" <luke_chen@aspeedtech.com>, "'arnd@arndb.de'" <arnd@arndb.de>, "'kusumi.tomohiro@gmail.com'" <kusumi.tomohiro@gmail.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infrad
 ead.org>, "'tytso@mit.edu'" <tytso@mit.edu>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "'gustavo.pimentel@synopsys.com'" <gustavo.pimentel@synopsys.com>, "'rdunlap@infradead.org'" <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "'pombredanne@nexb.com'" <pombredanne@nexb.com>, "Castro, Omar Eduardo" <omar.eduardo.castro@intel.com>, "'darrick.wong@oracle.com'" <darrick.wong@oracle.com>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jan 30, 2024 at 11:32:14PM +0000, Corona, Ernesto wrote:
> JTAG class driver provide infrastructure to support hardware/software JTAG platform drivers. It provide user layer API interface for flashing and debugging external devices which equipped with JTAG interface using standard transactions.

Please properly wrap your changelog text, didn't checkpatch warn of
this?

> Driver exposes set of IOCTL to user space for:
> - XFER:
>   SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
>   SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
> - GIOCSTATUS read the current TAPC state of the JTAG controller
> - SIOCSTATE Forces the JTAG TAPC to go into a particular state.
> - SIOCFREQ/GIOCFREQ for setting and reading JTAG frequency.
> - IOCBITBANG for low level control of JTAG signals.

Where are these ioctls implemented?  THat has nothing to do with this
patch itself, right?

And what's the "30" in the patch number above for?

confused,

greg k-h
