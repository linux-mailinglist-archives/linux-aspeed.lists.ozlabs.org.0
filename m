Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6042F778C
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jan 2021 12:23:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHJhR2y5mzDsfT
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jan 2021 22:23:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z5AjfT+9; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHJb908LTzDsfQ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jan 2021 22:18:44 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id s26so12580754lfc.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jan 2021 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8lRJYc4BKAdg1abXpS4nArMEOY798PG8SuBDu3ZJSlk=;
 b=Z5AjfT+9sIEoizTRGkvN4w7h+aIbEWUFfVlvbDDmlnjohr4b0yWluxpJGKYyhP8D/V
 I1i0WOneHrJlvabZSEV484vqeRo06wzgYuy4/74GQxjPiexyiI2Fkm1ofKktZpg7HkEF
 r4ZvbU4mI0geYG/QB4JeSCJf9N8xgug1O0oF5ndx9wZAMViLLczKz9zrs25GRrbzUDEv
 BJMyglfRGKtxkz4nP7IGeIWrG8nPeHLzf8SGJ9CXAJE6BD9YW/chFgczD1Sznmje0srx
 hhkjxqAvvBo8ZwYRisJz7S9OxGneqG3bM72c4IQ6Shyld3PwIXKv9EAlWxxvF/sX+Hcn
 DGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8lRJYc4BKAdg1abXpS4nArMEOY798PG8SuBDu3ZJSlk=;
 b=LVEUDACLqeIJAQWba9aWe5HvRd7TocIrn9puGNVbNDoWwK6fm4ClminhrkqMgh9HCB
 rH2v4RcqTfvDN9af2Cnm33XoiknoA3xCCBxwmd9zipeO7vE5ON4rmcUPkiaH8khxtne3
 E+cRjM1eTcuUCJPcoY9NXIGVD/xi+rMEEn/deBYccPiqQSwJfCB5S3SlGJP7OBXuEiZp
 dgR3Cv3MZ//x7k93Q3GAcJhErPcADZn3kgfcEL5ktIN8eGRQSZCPLTNzw4GqnsUDqmYv
 bjz/FTIW6J0NP8HBXqLgEIyoEZMjx79sLb1DNu9XJpAB70lmZo3SiUQV6Gn3L7/UomWs
 krew==
X-Gm-Message-State: AOAM530xKph1yT6YRc4LeTs2FnRji3YdI86pgei/Cr9LUu0YBfkH03NV
 z7JPAJZub59JtG588Kuvrsg=
X-Google-Smtp-Source: ABdhPJzgPbg0C6JprZSQzMH73kmf9AQHoEvG+h92c+jF6B1XAfqd45EqfR1dJgICUMDoG+cffcK6Cw==
X-Received: by 2002:a05:6512:3157:: with SMTP id
 s23mr5355726lfi.275.1610709520473; 
 Fri, 15 Jan 2021 03:18:40 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id x125sm864994lff.58.2021.01.15.03.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 03:18:39 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 10FBIaNw004539; Fri, 15 Jan 2021 14:18:37 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 10FBITBj004538;
 Fri, 15 Jan 2021 14:18:29 +0300
Date: Fri, 15 Jan 2021 14:18:29 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ernesto Corona <ernesto.corona@intel.com>
Subject: Re: [PATCH v29 1/6] drivers: jtag: Add JTAG core driver
Message-ID: <20210115111829.GB2971@home.paul.comp>
References: <20200413222920.4722-1-ernesto.corona@intel.com>
 <20200413222920.4722-2-ernesto.corona@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413222920.4722-2-ernesto.corona@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Rgrs <rgrs@protonmail.com>, Christian Gromm <christian.gromm@microchip.com>,
 Yiwei Zhang <zzyiwei@google.com>, Steven Filary <steven.a.filary@intel.com>,
 Alessandro Rubini <rubini@gnudd.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, William Breathitt Gray <vilhelm.gray@gmail.com>,
 Johan Hovold <johan@kernel.org>, Jiri Pirko <jiri@mellanox.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Tony Luck <tony.luck@intel.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Patrick Williams <patrickw3@fb.com>, Federico Vaga <federico.vaga@cern.ch>,
 Oleksandr Shamray <oleksandrs@mellanox.com>,
 Vadim Pasternak <vadimp@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 13, 2020 at 03:29:15PM -0700, Ernesto Corona wrote:
> --- /dev/null
> +++ b/drivers/jtag/jtag.c
> +	 case JTAG_SIOCFREQ:
> +		if (!jtag->ops->freq_set)
> +			return -EOPNOTSUPP;
> +
> +		if (get_user(value, (__u32 __user *)arg))
> +			return -EFAULT;

Does this need to be a pointer to a variable even if it's just a
number?

> +	case JTAG_IOCXFER:
> +		if (copy_from_user(&xfer, (const void __user *)arg,
> +				   sizeof(struct jtag_xfer)))
> +			return -EFAULT;
> +
> +		if (xfer.length >= JTAG_MAX_XFER_DATA_LEN)
> +			return -EINVAL;
> +
> +		if (xfer.type > JTAG_SDR_XFER)
> +			return -EINVAL;
> +
> +		if (xfer.direction > JTAG_READ_WRITE_XFER)
> +			return -EINVAL;
> +
> +		if (xfer.endstate > JTAG_STATE_UPDATEIR)
> +			return -EINVAL;
> +
> +		data_size = DIV_ROUND_UP(xfer.length, BITS_PER_BYTE);
> +		xfer_data = memdup_user(u64_to_user_ptr(xfer.tdio), data_size);

So this might copy more bits than the user specified, but that's
probably OK.

> +		if (IS_ERR(xfer_data))
> +			return -EFAULT;
> +
> +		err = jtag->ops->xfer(jtag, &xfer, xfer_data);
> +		if (err) {
> +			kfree(xfer_data);
> +			return err;
> +		}
> +
> +		err = copy_to_user(u64_to_user_ptr(xfer.tdio),
> +				   (void *)xfer_data, data_size);

And this might overwrite some bits and it's not OK, at least not
without a warning in the documentation.

> --- /dev/null
> +++ b/include/uapi/linux/jtag.h
> @@ -0,0 +1,194 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +// include/uapi/linux/jtag.h - JTAG class driver uapi
> +//
> +// Copyright (c) 2018 Mellanox Technologies. All rights reserved.
> +// Copyright (c) 2018 Oleksandr Shamray <oleksandrs@mellanox.com>
> +
> +#ifndef __UAPI_LINUX_JTAG_H
> +#define __UAPI_LINUX_JTAG_H
> +

Missing <linux/types.h>

Other API comments will be sent as a reply to the "Documentation:
jtag: Add ABI documentation" patch as they are not
implementation-specific.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
