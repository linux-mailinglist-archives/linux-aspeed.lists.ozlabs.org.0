Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B630BDBFA
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 08:34:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44svz020RRzDqMT
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 16:34:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="RA8rRbG1"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44svyp6YcGzDqKs
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 16:34:42 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id d13so10714737qth.5
 for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Apr 2019 23:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gl+VBxLR+GvLaPXntiUPaJTzvL30rd0oZ2WHgSedNcs=;
 b=RA8rRbG1034BWX7o4E1XRqbi+lga2VA0KM2tC+lbBBCvRzXpsOoOTXoak2ktUYXx3i
 mPlKfQGZyS1PpLgmgUT+NYxD5C9YkdzxxxC9o3fBSKPUEGLdn2VnEOnihBW9AfKADl2B
 3b3a+2m0IvZScTZRhHwa+0u5jjTOxViRNk6+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gl+VBxLR+GvLaPXntiUPaJTzvL30rd0oZ2WHgSedNcs=;
 b=XUlqgz+Aiz4Wpya3aH7NpYnZhIaRw1Jm51G8iUHU9afysEwAt0fwqZM26vEogJzIJw
 gaIX/ljgbL8w2UU92Xs0I30JeqmK5iHfUfiVRc6ZVhvqvSzGKRgOkJpwntrFqiJCcvhs
 DZMajtEcSHvwcA9Tzypxp+WVjI5eM+SOEcSNEEJec7GA3IdMimzLbnEpPH+eaCLUJeGh
 RdEk4tPjY38Z5aeTnB/F4SOQbG/ewdZVM7Ult+mBwKZdUprUQlqqgcFH59DXOR4P6U1z
 w37D6vP1AHOk4K1tvLe5eHSPDxsoXJabeUFcb8D4dU7mIRrfVy9ACzppu2VzmSj9dVeW
 naPQ==
X-Gm-Message-State: APjAAAX8DP7A9zXlhTDmRBJAxoDYwoKsO1q+wjKyjKmsMcz03ZjtMoR5
 EvotZi0UX7RYdb1z0FAVZoRzsICQsO3rDwWp24Y=
X-Google-Smtp-Source: APXvYqytTy2fdLvUmYedjHrz9dNMdoWzxnrks4lCz9FIJWSQW1pppC/60NhYFajTRR6X45EF3TyuzhcRlVv5SRz/TIA=
X-Received: by 2002:a0c:948e:: with SMTP id j14mr17487089qvj.245.1556519679861; 
 Sun, 28 Apr 2019 23:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190426165655.218228-1-venture@google.com>
In-Reply-To: <20190426165655.218228-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 06:34:28 +0000
Message-ID: <CACPK8XcbSZCpR5tjAXTSuvhfTyeQ_dJTTDOqZVVP=VWCxkaV6g@mail.gmail.com>
Subject: Re: [PATCH] misc: aspeed-p2a-ctrl: fix mixed declarations
To: Patrick Venture <venture@google.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed@lists.ozlabs.org, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arm <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 26 Apr 2019 at 16:57, Patrick Venture <venture@google.com> wrote:
>
> Fix up mixed declarations and code in aspeed_p2a_mmap.
>
> Tested: Verified the build had the error and that this patch resolved it
> and there were no other warnings or build errors associated with
> compilation of this driver.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Patrick Venture <venture@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/misc/aspeed-p2a-ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/aspeed-p2a-ctrl.c b/drivers/misc/aspeed-p2a-ctrl.c
> index 9736821972ef..b60fbeaffcbd 100644
> --- a/drivers/misc/aspeed-p2a-ctrl.c
> +++ b/drivers/misc/aspeed-p2a-ctrl.c
> @@ -100,6 +100,7 @@ static void aspeed_p2a_disable_bridge(struct aspeed_p2a_ctrl *p2a_ctrl)
>  static int aspeed_p2a_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>         unsigned long vsize;
> +       pgprot_t prot;
>         struct aspeed_p2a_user *priv = file->private_data;
>         struct aspeed_p2a_ctrl *ctrl = priv->parent;
>
> @@ -107,7 +108,7 @@ static int aspeed_p2a_mmap(struct file *file, struct vm_area_struct *vma)
>                 return -EINVAL;
>
>         vsize = vma->vm_end - vma->vm_start;
> -       pgprot_t prot = vma->vm_page_prot;
> +       prot = vma->vm_page_prot;
>
>         if (vma->vm_pgoff + vsize > ctrl->mem_base + ctrl->mem_size)
>                 return -EINVAL;
> --
> 2.21.0.593.g511ec345e18-goog
>
