Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCA424E8C
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 May 2019 14:02:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457ZCF4fbyzDqJC
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 May 2019 22:02:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.193; helo=mail-qk1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457ZC56kkKzDqJ1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 May 2019 22:02:41 +1000 (AEST)
Received: by mail-qk1-f193.google.com with SMTP id z128so10848061qkb.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 May 2019 05:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFHpERDGAM7rYKa/XXAMVPCU2p7ieNvbmiVwbMmHz6o=;
 b=o7zp34Ddjp2nHVwn8w+ozj1XeACrJL1JLJpXrsw7q5ytm0Y/Q1YDDbE3b+gfgZz8NZ
 fO/JhIq4yfboA4YUrpkarN3tz7ph5LxO5CII7AGtfmZl0i6a77nWAk+lVwIAj8r9Gc1X
 m8JjPj03UHhBCJPA///+B3WrIaDM5SHfHTIuFlD+ywBuMagalrWn8q6QroG0JoSAjI1F
 2wjE+PTMbBw72QuuiATkt4YdeFHpNvxE9YfU2f8cAPADO6Af1Ah43j6k/xipkHyTfPcg
 qbl1OTIhQUyvb1+e3xWQLFcZFlj+0jVD1xuYpmieJ+J+JUa/UtY38k2jS6DfIq27PJf6
 7L/w==
X-Gm-Message-State: APjAAAWmm0D2fHwTfGRzunxk2ekCLx1i+NFPqYmwc6JBBcjlN9EjNGJK
 Re3XV96D9+IUql9VRrUZLzs5KNjortD4ILPaFLKMhg3Q
X-Google-Smtp-Source: APXvYqz+JNxFrC1K8efOBIeJxisvtNkhhdYJVswIOoiVcFFJwa08OrBzOczrjY+m5IfqdGqcpIBYRLgf3CiTps9SNfc=
X-Received: by 2002:a05:620a:1085:: with SMTP id
 g5mr46695715qkk.182.1558440159035; 
 Tue, 21 May 2019 05:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com>
 <1558383565-11821-3-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1558383565-11821-3-git-send-email-eajames@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 May 2019 14:02:22 +0200
Message-ID: <CAK8P3a2HSOsw33VhAk4Z8ARiYn4jG68Ec7fynKbrFWUNDo37Wg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drivers/soc: Add Aspeed XDMA Engine Driver
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 10:19 PM Eddie James <eajames@linux.ibm.com> wrote:
> diff --git a/include/uapi/linux/aspeed-xdma.h b/include/uapi/linux/aspeed-xdma.h
> new file mode 100644
> index 0000000..2a4bd13
> --- /dev/null
> +++ b/include/uapi/linux/aspeed-xdma.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/* Copyright IBM Corp 2019 */
> +
> +#ifndef _UAPI_LINUX_ASPEED_XDMA_H_
> +#define _UAPI_LINUX_ASPEED_XDMA_H_
> +
> +#include <linux/types.h>
> +
> +/*
> + * aspeed_xdma_op
> + *
> + * upstream: boolean indicating the direction of the DMA operation; upstream
> + *           means a transfer from the BMC to the host
> + *
> + * host_addr: the DMA address on the host side, typically configured by PCI
> + *            subsystem
> + *
> + * len: the size of the transfer in bytes; it should be a multiple of 16 bytes
> + */
> +struct aspeed_xdma_op {
> +       __u32 upstream;
> +       __u64 host_addr;
> +       __u32 len;
> +};
> +
> +#endif /* _UAPI_LINUX_ASPEED_XDMA_H_ */

If this is a user space interface, please remove the holes in the
data structure.

I don't see how this is actually used in this patch, maybe you meant
the definition to be part of another patch?

    Arnd
