Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF12DE13A
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 01:31:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xGHr2yJjzDqL5
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 10:31:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=collabora.com
 (client-ip=46.235.227.227; helo=bhuna.collabora.co.uk;
 envelope-from=boris.brezillon@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qVhN5dyvzDqXW
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 01:29:24 +1100 (AEDT)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 144832910C7;
 Fri, 11 Oct 2019 15:29:21 +0100 (BST)
Date: Fri, 11 Oct 2019 16:29:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 04/16] mtd: spi-nor: aspeed: Add read training
Message-ID: <20191011162919.77b05cf8@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <3244b1ce-587c-6f12-cc9c-7eee0354e76b@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-5-clg@kaod.org>
 <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
 <3244b1ce-587c-6f12-cc9c-7eee0354e76b@kaod.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Oct 2019 10:30:07 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 11 Oct 2019 15:55:25 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

=20
> > (how can you determine if timings are good when IO pins always
> > stay high). Don't we have a command that return non-ff/non-0 data while
> > still being predictable and immutable?  =20
>=20
> Not that I know of on these controllers.

It's not really a controller thing, more a chip thing. The ideal
solution would be to have a loopback mode or an internal SRAM you can
write then read back, but AFAICT it doesn't exists. There's the SFDP
table as Vignesh mentioned, but we have the following problems:

1/ it might be too small (definitely < 16k)
2/ some NORs don't support SFDP (maybe not the ones we care about
   though)


