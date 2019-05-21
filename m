Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD2C24E6B
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 May 2019 13:59:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Z6s6DHYzDqLS
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 May 2019 21:59:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.193; helo=mail-qt1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457Z6k5TrzzDqD0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 May 2019 21:58:54 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id l3so9298452qtj.5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 May 2019 04:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RG1Hs0ESwnRVet51hMjdxLPwpJh7ZatYL2HtJdlc+r8=;
 b=qXvN+JD9ax7VUrpuvb0UcAoC+6Mygxes4897ZGHeZOoAJ9aJApgXP47iiKdSGi6HxU
 G6e/4NwsIHZfWUzxmkzB7Fdd4af02dk1aFsGhxpJ0F8pOUuzPp1bo+A3nuKuMQGVz6Sd
 XWtjfDw0ZVTt/AjH/EqNrPyCnDu3geAsxnJtTnNS48MyXu60XIz5vfvRR5mazzm8t4HU
 +Pwz3Ghc8K0l/rd3YHJRY/RBE/MluHaHUQEMWgUlUnV2ulETHEJ3r/omHplwL2kZZO8n
 Xb+yQZEg1C+5l9sxn4lpmVITNbieiNAI9p4I8UllSsdNsCS8GYhJXcX3hF8Bf/zYrYPE
 4itw==
X-Gm-Message-State: APjAAAUiqpEXrJvgr8B6GeF1dAFsyzjNHN5MwiapuuZ/4NMIyDJ5tmim
 IGvbrzJWQ+STgq1v7kNo1pVR4i1JvVR7iFVrMbg=
X-Google-Smtp-Source: APXvYqypDXVBS4ifbaE5zemqBahreul8x/ODVifparRdwfQ7naR5cZfsaWocJlLatNxgSqyZ9gsjCSMSIipNIKjRplI=
X-Received: by 2002:a0c:9e55:: with SMTP id z21mr65483709qve.45.1558439930891; 
 Tue, 21 May 2019 04:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com>
 <1558383565-11821-6-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1558383565-11821-6-git-send-email-eajames@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 May 2019 13:58:34 +0200
Message-ID: <CAK8P3a0W=kUxTU7M5diSL3pcFQydXbB0ABwqj6NUhKj2hQC_wg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drivers/soc: xdma: Add debugfs entries
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

>  struct aspeed_xdma_client {
> @@ -656,6 +662,92 @@ static int aspeed_xdma_init_mem(struct aspeed_xdma *ctx)
>         return 0;
>  }
>
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static ssize_t aspeed_xdma_debugfs_vga_read(struct file *file,
> +                                           char __user *buf, size_t len,
> +                                           loff_t *offset)
> +{
> +       int rc;


I think it would be more readable to move the IS_ENABLED()
check into the function and do

         if (!IS_ENABLED(CONFIG_DEBUG_FS))
                  return;

in the init_debugfs() function.

> +       struct inode *inode = file_inode(file);
> +       struct aspeed_xdma *ctx = inode->i_private;
> +       void __iomem *vga = ioremap(ctx->vga_phys, ctx->vga_size);
> +       loff_t offs = *offset;
> +       void *tmp;
> +
> +       if (!vga)
> +               return -ENOMEM;
> +
> +       if (len + offs > ctx->vga_size) {
> +               iounmap(vga);
> +               return -EINVAL;
> +       }

The usual read() behavior is to use truncate the
read at the maximum size, rather than return an
error for an access beyond the end of file.

> +
> +       tmp = kzalloc(len, GFP_KERNEL);
> +       if (!tmp) {
> +               iounmap(vga);
> +               return -ENOMEM;
> +       }

Use 'goto out;' to consolidate the unmap/free here?

> +static void aspeed_xdma_init_debugfs(struct aspeed_xdma *ctx)
> +{
> +       ctx->debugfs_dir = debugfs_create_dir(DEVICE_NAME, NULL);
> +       if (IS_ERR_OR_NULL(ctx->debugfs_dir)) {

debugfs_create_dir() never returns NULL.

Usually if you have to use IS_ERR_OR_NULL() in your code, that
is a bug, or a very badly defined interface.

      Arnd
