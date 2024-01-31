Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1F843C2B
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 11:21:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=linYKR0L;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TFSskRoT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPyk65408z3c2b
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 21:21:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=linYKR0L;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TFSskRoT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 347 seconds by postgrey-1.37 at boromir; Wed, 31 Jan 2024 21:21:06 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPyjt3Jskz2yk3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 21:21:06 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0ECEA5C00FD;
	Wed, 31 Jan 2024 05:15:14 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 31 Jan 2024 05:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1706696114; x=1706782514; bh=PIqvIF++O8
	prNRQycSl4yvs3SVb1+7vU4k2CiJh82ow=; b=linYKR0LyGqBh3M5lanjAOuEuZ
	omaiGbbc6Spdg52E+kLUwNSZnT0g/VknKNhG+PU3jp1wLgBNbcFFsXj5aHbuNhOO
	OOsQhVBa5lcdMuJ1xx4QA68wn/zeqrtqkSl4EqPMY3gZnJSc9jPmSi0wi7mD0O9U
	v8k2ORiIpt4xKcRTV8eYey2BmDV9C776BcaGEREoWM7yJmAINYRdSZqQ7Ka03iGd
	+w82j6BX22e+lxUB18S8Ew1KbNUHWfpkPsYROZX83gYkgJlEefxRCr1TFsQhLN/V
	Qx+QbMoACnWtMG3Jml1qHLjHIc+ni3bQXRDODNUE8jqfNmSCBx5e3vB0xekQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706696114; x=1706782514; bh=PIqvIF++O8prNRQycSl4yvs3SVb1
	+7vU4k2CiJh82ow=; b=TFSskRoT5bHEuYQ56uM/KKpe/PIW2urOakSkflYOdaSi
	LxCMxzYlgaLZoroFxVlKxUKGX11MZiuNYX+sZ3YVN+UH8QqBKJ737VV3Da+Ruvt/
	S6gNIs65AdBUOVuc+jkyEnSBGlxUDu0+LcsDOvaEGqcSfB0Enza4dGPcHRm2Nfx0
	C7MRL23WzpBLOwhkjOHmGtVOVc/MPUoW+OgOcqrnjudjsItvclO3PVM5Zy3/ffkr
	yddzV3zLYUkcioedp2G7JpFPuS5/BEsZlSwgPOD/MFpE5CXLgXEkzRp5wQtSfBPH
	KB/uojd5p6UCXl25PDJu7+YHsVJ+fGjmKe0VwYwwOg==
X-ME-Sender: <xms:sB26ZRrljK2vyL7xQVyBlEga_u2-Q2mu_ZJwQRKoHA_g9vDs57VQPA>
    <xme:sB26ZToEwYJTVLKnWzJevpF4m3QWTVDn1L4dQF62DFD7JJ7m6eLWg70hRYQPa67NK
    OazVPOTbzWRNKLBf5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtledguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:sB26ZeNA0z5pqyylBq1yb0e42jwqKTqNxL0Bo5czCN7rwXImd8n66w>
    <xmx:sB26Zc7-ZXwKR70kdAEMYa5v3Gd1VQA0n7TYNEiHhLvEewyPfsV8fg>
    <xmx:sB26ZQ5WhmATJ2LRwwsSaOfzi5_3AAwVKTZjVNM4aE7E7Edrzd_jQg>
    <xmx:sh26ZSTp6M1RZ9IBwZQDPwqDfmc_YHtMkDjFM8NRmF8UQgtUF5lM1g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5D984B6008D; Wed, 31 Jan 2024 05:15:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <4ce460c4-00ab-4665-8bfa-6f16cdcb38e3@app.fastmail.com>
In-Reply-To:  <LV8PR11MB846358B901CA67965197C4AB8B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
References:  <LV8PR11MB846358B901CA67965197C4AB8B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Date: Wed, 31 Jan 2024 11:14:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Corona, Ernesto" <ernesto.corona@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 30 1/7] Add JTAG core driver
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>, "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'christian.gromm@microchip.com'" <christian.gromm@microchip.com>, "'zzyiwei@google.com'" <zzyiwei@google.com>, "Filary,
 Steven A" <steven.a.filary@intel.com>, "'rubini@gnudd.com'" <rubini@gnudd.com>, "Chen,
 Luke" <luke_chen@aspeedtech.com>, Kees Cook <keescook@chromium.org>, Johan Hovold <johan@kernel.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, Jiri Pirko <jiri@nvidia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, Tony Luck <tony.luck@intel.com>, "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "'patrickw3@fb.com'" <patrickw3@fb.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "'pombredanne@nexb.com'" <pombredanne@nexb.com>, "Castro,
 Omar Eduardo" <omar.eduardo.castro@intel.com>, "'federico.vaga@cern.ch'" <federico.vaga@cern.ch>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 31, 2024, at 00:26, Corona, Ernesto wrote:
>
> +static long jtag_ioctl(struct file *file, unsigned int cmd, unsigned 
> long arg)
> +{
> +	struct jtag *jtag = file->private_data;
> +	struct jtag_tap_state tapstate;
> +	struct jtag_xfer xfer;
> +	struct bitbang_packet bitbang;
> +	struct tck_bitbang *bitbang_data;
> +	struct jtag_mode mode;
> +	u8 *xfer_data;
> +	u32 data_size;
> +	u32 value;
> +	u32 active;
> +	int err;
> +
> +	if (!arg)
> +		return -EINVAL;

Why do you need a different return code for one invalid
pointer, compared to any other invalid pointer? It seems
better to just return the -EFAULT from put_user here.

> +	switch (cmd) {
> +	case JTAG_GIOCFREQ:
> +		if (!jtag->ops->freq_get)
> +			return -EOPNOTSUPP;
> +
> +		err = jtag->ops->freq_get(jtag, &value);
> +		if (err)
> +			break;
> +		dev_dbg(jtag->miscdev.parent, "JTAG_GIOCFREQ: freq get = %d",
> +			value);

These dev_dbg() statements look like this is from
code that is not quite ready. There are sometimes
reasons to leave debug prints in a driver, but those
are usually for events that happen asynchronously,
rather than directly being part of a user call.

I would just remove these all.

> +		if (put_user(value, (__u32 __user *)arg))
> +			err = -EFAULT;
> +		break;

The open-coded typecasts look suboptimal, and the function
is rather long. I would suggest you rearrange the ioctl
handler to

- have one function that takes the correct argument type
  (__u32 __user *arg) for each command

- a 'void __user *' variable in the ioctl function itself
  that has a single cast and passes the pointer to those
  functions.

> +
> +		print_hex_dump_debug("O:", DUMP_PREFIX_NONE, 16, 1, xfer_data,
> +				     data_size, false);

If this is enabled, it looks like userspace can produce
a denial-of-service by sending down gigabytes of data
that end up being printed.

> +static const struct file_operations jtag_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= jtag_open,
> +	.llseek		= noop_llseek,
> +	.unlocked_ioctl	= jtag_ioctl,
> +	.release	= jtag_release,
> +};

You should set

       .compat_ioctl = compat_ptr_ioctl

otherwise this driver won't be able to be used from
32-bit applications.

> +struct jtag *jtag_alloc(struct device *host, size_t priv_size,
> +			const struct jtag_ops *ops)
> +{
...
> +
> +	jtag = kzalloc(sizeof(*jtag), GFP_KERNEL);
> +	if (!jtag)
> +		return NULL;
> +	jtag->priv = kzalloc(priv_size, GFP_KERNEL);
> +	if (!jtag->priv)
> +		return NULL;
> +
> +	jtag->ops = ops;
> +	jtag->miscdev.parent = host;
> +
> +	return jtag;
> +}
> +EXPORT_SYMBOL_GPL(jtag_alloc);
> +
> +void jtag_free(struct jtag *jtag)
> +{
> +	kfree(jtag);
> +}
> +EXPORT_SYMBOL_GPL(jtag_free);

You have two 'kzalloc' but only one 'kfree' here. You
also leak the first allocation if the second one fails.

The usual way to do this is to have a single allocation
of 'sizeof(*jtag) + priv_size' and then point
jtag->priv to 'jtag + 1'.

> +struct jtag_tap_state {
> +	__u8	reset;
> +	__u8	from;
> +	__u8	endstate;
> +	__u32	tck;
> +};

This structure has a padding byte inside, which can
leak kernel information when copied back to userspace.
In some cases (not here) the padding can also lead
to incompatible layouts between architectures.

Just add an explicit padding byte and make sure this
gets properly initialized when copying to userspace
and checked for being zero when copied to the kernel.

> +/**
> + * struct jtag_xfer - jtag xfer:
> + *
> + * @type: transfer type
> + * @direction: xfer direction
> + * @from: xfer current state
> + * @endstate: xfer end state
> + * @padding: xfer padding
> + * @length: xfer bits length
> + * @tdio : xfer data array
> + *
> + * Structure provide interface to JTAG device for JTAG SDR/SIR xfer 
> execution.
> + */
> +struct jtag_xfer {
> +	__u8	type;
> +	__u8	direction;
> +	__u8	from;
> +	__u8	endstate;
> +	__u32	padding;
> +	__u32	length;
> +	__u64	tdio;
> +};

This one is indeed incompatible between i386 userland
and x86_64 kernels, and will need explicit padding between
length and tdio.

> +/**
> + * struct bitbang_packet - jtag bitbang array packet:
> + *
> + * @data:   JTAG Bitbang struct array pointer(input/output)
> + * @length: array size (input)
> + *
> + * Structure provide interface to JTAG device for JTAG bitbang bundle 
> execution
> + */
> +struct bitbang_packet {
> +	struct tck_bitbang *data;
> +	__u32	length;
> +} __attribute__((__packed__));

This one has no implicit padding because of the
__attribute__((__packed__)), but that attribute actually
makes things worse since pointers must be naturally aligned
on most architectures.

The pointer also makes this structure incompatible for
32-bit userspace, so you should use the same u64_to_user_ptr()
trick you have elsewhere, or ideally completely avoid the
extra indirection.

> +/**
> + * struct jtag_bitbang - jtag bitbang:
> + *
> + * @tms: JTAG TMS
> + * @tdi: JTAG TDI (input)
> + * @tdo: JTAG TDO (output)
> + *
> + * Structure provide interface to JTAG device for JTAG bitbang 
> execution.
> + */
> +struct tck_bitbang {
> +	__u8	tms;
> +	__u8	tdi;
> +	__u8	tdo;
> +} __attribute__((__packed__));

Here the __packed__ should have no effect here, what is it for?

> +/* ioctl interface */
> +#define __JTAG_IOCTL_MAGIC	0xb9
> +
> +#define JTAG_SIOCSTATE	_IOW(__JTAG_IOCTL_MAGIC, 0, struct 
> jtag_tap_state)
> +#define JTAG_SIOCFREQ	_IOW(__JTAG_IOCTL_MAGIC, 1, unsigned int)
> +#define JTAG_GIOCFREQ	_IOR(__JTAG_IOCTL_MAGIC, 2, unsigned int)
> +#define JTAG_IOCXFER	_IOWR(__JTAG_IOCTL_MAGIC, 3, struct jtag_xfer)
> +#define JTAG_GIOCSTATUS _IOWR(__JTAG_IOCTL_MAGIC, 4, enum 
> jtag_tapstate)

Enums are not good for interface definitions, just use a __u32 here.
I would also list __u32 instead of 'unsigned int' for the others,
though that makes no practical difference.

> +/**
> + * struct tms_cycle - This structure represents a tms cycle state.
> + *
> + * @tmsbits: is the bitwise representation of the needed tms 
> transitions to
> + *           move from one state to another.
> + * @count:   number of jumps needed to move to the needed state.
> + *
> + */
> +struct tms_cycle {
> +	unsigned char tmsbits;
> +	unsigned char count;
> +};

Maybe also use __u8 here.

> +/*
> + * This is the complete set TMS cycles for going from any TAP state to 
> any
> + * other TAP state, following a "shortest path" rule.
> + */
> +static const struct tms_cycle _tms_cycle_lookup[][16] = {
> +/*	    TLR        RTI        SelDR      CapDR      SDR        Ex1DR*/
> +/* TLR  */{{0x00, 0}, {0x00, 1}, {0x02, 2}, {0x02, 3}, {0x02, 4}, 
> {0x0a, 4},
> +/*	    PDR        Ex2DR      UpdDR      SelIR      CapIR      SIR*/
> +	    {0x0a, 5}, {0x2a, 6}, {0x1a, 5}, {0x06, 3}, {0x06, 4}, {0x06, 5},
> +/*	    Ex1IR      PIR        Ex2IR      UpdIR*/
> +	    {0x16, 5}, {0x16, 6}, {0x56, 7}, {0x36, 6} },

It's not clear if this is part of the user ABI of this specific
driver or if it's just generic information about jtag. My feeling
is that this does not belong into this header if this is something
that an application would use regardless of the kernel
interface.

     Arnd
