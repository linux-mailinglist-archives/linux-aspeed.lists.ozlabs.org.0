Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD328443A7
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 17:05:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=c4bh8QXx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ6Ml13Ymz3vyp
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 03:05:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=c4bh8QXx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 411 seconds by postgrey-1.37 at boromir; Thu, 01 Feb 2024 03:05:48 AEDT
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ6Mc26qnz3vyB
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 03:05:47 +1100 (AEDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 48D7F47AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706716731; bh=PLm8WUNIAKoIK/mO/devLpWdKufj7FVlfUUU03pGBg0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c4bh8QXx9iugcyu/pTN7YIw9hBi+qKv5fFBnxl9IYk/syHRzgig29LuO2sxCRGcp+
	 nJgEL1DNJ7NL9P3isxVgP4XnJSk6l9XHtcbISiFgpOcK07on2ssCpbLAhW7Mb7Wb/J
	 UrTmxw8cKwdc74GZiF+7iC0B+21uXsk7HrYrd4w3taDp65SikB7OyO1Z2N6JrA1oZy
	 RJXWY97SOnx2ClTF2yJuEV6AK04NBHVndlZ0yde7S+X0LP7NdK8GDeGHRVddOR3nM/
	 UtJ42x0Xoc9xOJh95NUr+91SVhaSeX51S79iLifUoLPiMRwv7e8Tj++Z3KxhYBKPvH
	 b22L9ZOXfDZZw==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 48D7F47AA7;
	Wed, 31 Jan 2024 15:58:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Corona, Ernesto" <ernesto.corona@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 30 4/7] Add ABI documentation
In-Reply-To: <LV8PR11MB8463E4402495BACB9E3ACE588B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
References: <LV8PR11MB8463E4402495BACB9E3ACE588B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Date: Wed, 31 Jan 2024 08:58:50 -0700
Message-ID: <87mssl7av9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'arnd@arndb.de'" <arnd@arndb.de>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "'jhugo@codeaurora.org'" <jhugo@codeaurora.org>, "Filary, Steven A" <steven.a.filary@intel.com>, "'linus.walleij@linaro.org'" <linus.walleij@linaro.org>, "'manivannan.sadhasivam@linaro.org'" <manivannan.sadhasivam@linaro.org>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "Castro, Omar
 Eduardo" <omar.eduardo.castro@intel.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "Corona, Ernesto" <ernesto.corona@intel.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>, "Chen, Luke" <luke_chen@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

"Corona, Ernesto" <ernesto.corona@intel.com> writes:

> Added document that describe the ABI for JTAG class driver

A few comments

> diff --git a/Documentation/jtag/index.rst b/Documentation/jtag/index.rst
> new file mode 100644
> index 000000000000..8a2761d1c17e
> --- /dev/null
> +++ b/Documentation/jtag/index.rst

Please, let's not create another top-level directory for this; this
looks like information that belongs in the userspace-api book.

> @@ -0,0 +1,18 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==============================
> +Joint Test Action Group (JTAG)
> +==============================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   jtag-summary
> +   jtagdev
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> diff --git a/Documentation/jtag/jtag-summary.rst b/Documentation/jtag/jtag-summary.rst
> new file mode 100644
> index 000000000000..07cfa7a761d7
> --- /dev/null
> +++ b/Documentation/jtag/jtag-summary.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====================================
> +Linux kernel JTAG support
> +====================================
> +
> +Introduction to JTAG
> +====================
> +
> +JTAG is an industry standard for verifying hardware. JTAG provides access to
> +many logic signals of a complex integrated circuit, including the device pins.
> +
> +A JTAG interface is a special interface added to a chip.
> +Depending on the version of JTAG, two, four, or five pins are added.
> +
> +The connector pins are:
> + * TDI (Test Data In)
> + * TDO (Test Data Out)
> + * TCK (Test Clock)
> + * TMS (Test Mode Select)
> + * TRST (Test Reset) optional
> +
> +JTAG interface is designed to have two parts - basic core driver and
> +hardware specific driver. The basic driver introduces a general interface
> +which is not dependent of specific hardware. It provides communication
> +between user space and hardware specific driver.
> +Each JTAG device is represented as a char device from (jtag0, jtag1, ...).
> +Access to a JTAG device is performed through IOCTL calls.
> +
> +Call flow example:
> +::

You can express this more readably as just

  Call flow example::



> +
> +	User: open  -> /dev/jatgX -> JTAG core driver -> JTAG hardware specific driver
> +	User: ioctl -> /dev/jtagX -> JTAG core driver -> JTAG hardware specific driver
> +	User: close -> /dev/jatgX -> JTAG core driver -> JTAG hardware specific driver
> +
> +
> +THANKS TO
> +---------
> +Contributors to Linux-JTAG discussions include (in alphabetical order,
> +by last name):
> +
> +- Omar Castro
> +- Ernesto Corona
> +- Steven Filary
> +- Vadim Pasternak
> +- Jiri Pirko
> +- Oleksandr Shamray
> +- Billy Tsai
> \ No newline at end of file

Files should end in a newline

[...]

> +===============  =========  =======  =====================================================
> +Bit Field        Bit begin  Bit end  Description
> +===============  =========  =======  =====================================================
> +rsvd             25         31       Reserved, not used
> +pad data         24         24       Value used for pre and post padding. Either 1 or 0.
> +post pad count   12         23       Number of padding bits to be executed after transfer.
> +pre pad count    0          11       Number of padding bit to be executed before transfer.
> +===============  =========  =======  =====================================================

You should be able to wrap the final column of the table, avoiding these
long lines.

Thanks,

jon
