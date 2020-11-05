Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EA12A8223
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Nov 2020 16:24:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRnPd3pZczDqx1
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Nov 2020 02:24:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=boris.brezillon@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
X-Greylist: delayed 525 seconds by postgrey-1.36 at bilbo;
 Fri, 06 Nov 2020 02:20:33 AEDT
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRnJx6BWtzDr6x
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Nov 2020 02:20:33 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 08C0F1F464C0;
 Thu,  5 Nov 2020 15:11:36 +0000 (GMT)
Date: Thu, 5 Nov 2020 16:11:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, <robh+dt@kernel.org>
Subject: Re: [v3 4/4] spi: aspeed: Add ASPEED FMC/SPI memory controller driver
Message-ID: <20201105161132.37eb3265@collabora.com>
In-Reply-To: <fd8fa472-53bb-c992-3dc2-5a984a439c07@kaod.org>
References: <20201105120331.9853-1-chin-ting_kuo@aspeedtech.com>
 <20201105120331.9853-5-chin-ting_kuo@aspeedtech.com>
 <fd8fa472-53bb-c992-3dc2-5a984a439c07@kaod.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, 5 Nov 2020 15:09:11 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello Chin-Ting,
>=20
> Thanks for this driver. It's much cleaner than the previous and we should=
=20
> try adding support for the AST2500 SoC also. I guess we can keep the old=
=20
> driver for the AST2400 which has a different register layout.
>=20
> On the patchset, I think we should split this patch in three :=20
>=20
>  - basic support
>  - AHB window calculation depending on the flash size
>  - read training support =20

I didn't look closely at the implementation, but if the read training
tries to read a section of the NOR, I'd recommend exposing that feature
through spi-mem and letting the SPI-NOR framework trigger the training
instead of doing that at dirmap creation time (remember that spi-mem is
also used for SPI NANDs which use the dirmap API too, and this training
is unlikely to work there).

The SPI-NOR framework could pass a read op template and a reference
pattern such that all the spi-mem driver has to do is execute the
template op and compare the output to the reference buffer.


>=20
> We should avoid magic values when setting registers. This is confusing=20
> and defines are much better.
> =20
> AST2500 support will be a bit challenging because HW does not allow   =20
> to configure a 128MB AHB window, max is 120MB This is a bug and the work=
=20
> around is to use user mode for the remaining 8MB. Something to keep in
> mind.

Most SPI-MEM controllers don't have such a big dirmap window anyway, and
that shouldn't be a problem, because we don't expose the direct mapping
directly (as would be done if we were trying to support something like
XIP). That means that, assuming your controller allows controlling the
base spi-mem address the direct mapping points to, you should be able
to adjust the window at runtime and make it point where you requested.

Note that dirmap_{read,write}() are allowed to return less data than
requested thus simplifying the case where a specific access requires a
window adjustment in the middle of an read/write operation.

Regards,

Boris
