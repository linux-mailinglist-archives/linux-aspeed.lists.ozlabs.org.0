Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1B2CD39D
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Dec 2020 11:33:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmscZ3WrxzDrFj
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Dec 2020 21:33:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RNUgwCHM; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmscD6qXKzDrFj
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Dec 2020 21:33:00 +1100 (AEDT)
Date: Thu, 3 Dec 2020 10:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606991577;
 bh=43yNdax6pGHrO0BTp2xJ0YBAHuZmVV9Ah1L6cygJuMU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=RNUgwCHMYUgjhrvu5Ze9nx9Prvgbl95hJ+4WEeXVeuh9jqHmetJY9lgIg17dQDyFO
 J3XOiC68vEB9GfEGK8nUzLnbrroIZTiRqc+9tah/cO4DWnXm8wcmaaqjw8kBME2o+V
 PLQV9D0DSnG+3gAY1fBep5BABJ/Xqt1IYdftBO4/NjonpKhNEhZBq+KWyo5VX8XjeK
 9qdV2pHC3AJ3CiQtS9ebm+wMPONbSY1r/QQ0DzMB2yPIeumKROIrguVG/njTNK1AOk
 prOAiZlmlqds7QlSLaj4xO8OhfSB4IidcNklQLwIgmRIbde3e6x0rJKrBQuNKyp6Mc
 vqaDydV5/4g+w==
From: Mark Brown <broonie@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [v2 0/4] Porting ASPEED FMC/SPI memory controller driver
Message-ID: <20201203103227.GC4700@sirena.org.uk>
References: <20201103072202.24705-1-chin-ting_kuo@aspeedtech.com>
 <160683107674.35139.14509237313835347013.b4-ty@kernel.org>
 <CACPK8Xe4TcRVBnZL7vtqGq1PTe5NEx1k4hvk4FDeYgJQ9HALFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline
In-Reply-To: <CACPK8Xe4TcRVBnZL7vtqGq1PTe5NEx1k4hvk4FDeYgJQ9HALFg@mail.gmail.com>
X-Cookie: Sacred cows make great hamburgers.
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 02, 2020 at 09:19:47PM +0000, Joel Stanley wrote:
> On Tue, 1 Dec 2020 at 13:58, Mark Brown <broonie@kernel.org> wrote:

> > Applied to
> >
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

> Really? Or is there a bug in one of your scripts :)

Not my scripts, b4!

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/IvrsACgkQJNaLcl1U
h9CS2wf+JYv7MdfNnO9GFIy0AVuTJlRHvbhFYMX35CrKtG3bCDbrHP/9CgwE3NCP
dv5bms58wdNxCvRtu180AHxs2pVBIZKYFIgIIiNayARpwxqupKFr6qMTGHtx76bR
hu4n8ErziSlUzhfnTKsl9eB3DjKoYq5f6hyibKQvElzv72wjyeO21B/ME8x6CBiV
8UGAYjhXnuuu+ovTvKUCp6cTgPrPJ/PVu2rFB//hTj3BxxAhMgUve9Wye6o3TRpC
mQETkDnHgCPtrVHl0zqDK8LusqGDLf9hZ6FEM6DHC1HgMGizKlVaH2GceMJHFfd2
pOFCbLwEik6HfoDBjv3wd8NWY7uhiQ==
=7doF
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
