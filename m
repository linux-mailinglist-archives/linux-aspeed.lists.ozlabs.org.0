Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A0A843166
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 00:38:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aIykwy+B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPhS46JgXz3069
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 10:38:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aIykwy+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPhRz0X36z3069
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 10:38:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 631BB61198;
	Tue, 30 Jan 2024 23:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F9BC43390;
	Tue, 30 Jan 2024 23:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706657882;
	bh=LqEbxy5HFwLmJ2Rg9GQ3/teWihbE1b+vjKDjuZxmXg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIykwy+BCwLMAq+2b9xkOhneoaDOecqNWdPGSi6LBLwN7i3ltTjP7dNc0pgNVgDJH
	 Eznt2PcLNCX8VDyyBOQIRwLLPVJ0Iq8g5iMqc/xWAtdkqBQlB9Iy2yJeEGr5dUZkTW
	 wOV60NI4KXrT1ImjNe88gZRIpyIT+ZmzfVlHLuEI=
Date: Tue, 30 Jan 2024 15:38:01 -0800
From: "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>
To: "Corona, Ernesto" <ernesto.corona@intel.com>
Subject: Re: [PATCH 30 6/7] Add JTAG core driver Maintainers
Message-ID: <2024013028-material-germless-aa23@gregkh>
References: <LV8PR11MB846312B6C1F23325DACDF3778B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV8PR11MB846312B6C1F23325DACDF3778B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
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
Cc: "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'robh@kernel.org'" <robh@kernel.org>, "'arnd@arndb.de'" <arnd@arndb.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Filary, Steven A" <steven.a.filary@intel.com>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "'nicolas.ferre@microchip.com'" <nicolas.ferre@microchip.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "'lukas.bulwahn@gmail.com'" <lukas.bulwahn@gmail.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'andriy.shevchenko@linux.intel.com'" <andriy.shevchenko@linux.intel.com>, "'davem@davemloft.net'" <davem@davemloft.net>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>,
  "Chen, Luke" <luke_chen@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jan 30, 2024 at 11:32:33PM +0000, Corona, Ernesto wrote:
> JTAG class driver provide infrastructure to support hardware/software JTAG platform drivers. It provide user layer API interface for flashing and debugging external devices which equipped with JTAG interface using standard transactions.
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Ernesto Corona <ernesto.corona@intel.com>
> Signed-off-by: Omar Castro <omar.eduardo.castro@linux.intel.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Jiri Pirko <jiri@nvidia.com>
> Cc: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Cc: Steven Filary <steven.a.filary@intel.com>
> Cc: Amithash Prasad <amithash@fb.com>
> Cc: Patrick Williams <patrickw3@fb.com>
> Cc: Luke Chen <luke_chen@aspeedtech.com>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: Rgrs <rgrs@protonmail.com>
> ---
> MAINTAINERS | 13 +++++++++++++
> 1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d1052fa6a69..764732f1fe19 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11532,6 +11532,19 @@ L:                linux-serial@vger.kernel.org
> S:           Orphan
> F:           drivers/tty/serial/jsm/
> +JTAG SUBSYSTEM
> +M:        Oleksandr Shamray <oleksandrs@mellanox.com>
> +M:        Vadim Pasternak <vadimp@mellanox.com>
> +M         Ernesto Corona <ernesto.corona@intel.com>
> +M:        Omar Castro <omar.eduardo.castro@linux.intel.com>
> +M:        Jiri Pirko <jiri@nvidia.com>
> +S:          Maintained
> +F:          Documentation/ABI/testing/jtag-dev
> +F:          Documentation/devicetree/bindings/jtag/
> +F:          drivers/jtag/
> +F:          include/linux/jtag.h
> +F:          include/uapi/linux/jtag.h
> +
> K10TEMP HARDWARE MONITORING DRIVER
> M:         Clemens Ladisch <clemens@ladisch.de>
> L:            linux-hwmon@vger.kernel.org

Something went wrong, your patch is corrupted and your mix of spaces and
tabs is not right (and you forgot a blank line before your entry) :(

