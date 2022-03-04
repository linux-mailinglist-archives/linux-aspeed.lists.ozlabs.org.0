Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9154CD0B7
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 10:06:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K925N6gJzz30JX
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 20:06:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=b2jKdJAD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=foxmail.com (client-ip=203.205.221.209;
 helo=out203-205-221-209.mail.qq.com; envelope-from=liwg06@foxmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=b2jKdJAD; dkim-atps=neutral
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com
 [203.205.221.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K925D2WnQz2xm1
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 20:05:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1646384722;
 bh=+zeCSGEfxakxFklDdSc/duLV+p8vn263llWZGLYhBYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b2jKdJADpGGmW9uIxehpLl+GGqBp4BR6fcfPc2w3NfeYnuvEzrKP0cAkG05NLQU74
 RdP3NrTqwH+v0cCbM+ws9MKKkxdciaEStWuRBwwxTTcazbphlcvvjc04kZsqMjFU57
 i0cP5eqwhuWRde10NbIO4MyuxFsY5JtZ01/ykkAE=
Received: from localhost.localdomain ([111.193.130.237])
 by newxmesmtplogicsvrszc10.qq.com (NewEsmtp) with SMTP
 id 104BBE60; Fri, 04 Mar 2022 17:04:04 +0800
X-QQ-mid: xmsmtpt1646384644th4bqqkfw
Message-ID: <tencent_5F734C284FE3294244B94EDA77CA088AC806@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCtT6bhTmrxYrlYZglTzq/65Esm6UXfHWX4cp57TLlU8H4kBIuavl
 JcIObNLiq1TChdb65LO0gpMlXvWkJN89A8pH4qQHhiRASoeobGSfkuf4kf2ac0eQp682f+vbG131
 QRIMJwsg5OuuqJXvKwSkXUN7eVfmnE5bITVpTWy24JIx1iByjlUQ0bNdlVKNcvu4LA6vD3Z2wmb8
 WQWYt3cC39us+HHoI8oS6OJ0Zk59ozWIig/BpV8KAoTE1wBJQd9TIkXFylyxw8kSonH8IUL+ouMY
 CSbq6Y3oyP2mH3ZGRBllzE4t/K3yNGVploO0oXKejFsWLHVG0iTeFCTyP/OKIsyHWY5hSDKNUasH
 S7pVKW2t3wArsRLflW4aTds0G97mjwOK2mboCFHGz6cvuxEY3X/2gIXFgZFU1IHUSCSvykK0Y72E
 Zc7KFR1KfoPxZNYj7GS+6ReygQt98eFrGIg7mTtR4dXOvV2QxzhvUz+qLmbp9RFO+dIBrvrIKIak
 jCUM9nmyGa48S6vyb4RRc0LbbzJhK1BI4dCXH/oJJ+rUuLk2kgRngY8h72kE35xhVfBSilQe5WB2
 NG6nIoRNyqhFsJeVrRizcPTFGNx3Ro+i0Pis3Q4Flhtq/2lX/RMRhp2jSdmQw5T5lX/I8tELdXtR
 quH2dUilB74DPfOOSROFu5AjLuxkmzTJgqgrNpZjTaxo2yMDVCvLHIqVwkvQNznOKKAA5/+Du2+Z
 zGPdB6JM/jlzt0Gm9MQG8H8K4gQ5ZjFw1YkXZMtQ7cmychauijY8ZRloquvZey/CJ+rK+mcElq0b
 BLfsdjsJDy80vxR5Sh6q0yDJsmzURGxBFQs2kV/plr+brDmCIjoX9P0dCmVZAzBK3IUJcDYh9p4H
 A+mXEjj8qcOh84ciCrSYw=
From: Weiguo Li <liwg06@foxmail.com>
To: linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2] pinctrl: aspeed: fix null dereference in debug
Date: Fri,  4 Mar 2022 17:04:04 +0800
X-OQ-MSGID: <20220304090404.24247-1-liwg06@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_68563A6FDF372313228831913CC3A7041108@qq.com>
References: <tencent_68563A6FDF372313228831913CC3A7041108@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Petr Vorel <pvorel@suse.cz>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 02 Mar 2022 15:12:24 Weiguo Li wrote:
> "pdesc" is null checked, but already dereferenced ahead in debug.
> Swap their positions to avoid potential null dereference.
> 
> Signed-off-by: Weiguo Li <liwg06@foxmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v2:
> * resend it after registering an account in aspeed patchwork
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index c94e24aadf92..83d47ff1cea8 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -236,11 +236,11 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>   const struct aspeed_sig_expr **funcs;
>   const struct aspeed_sig_expr ***prios;
>  
> - pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
> -
>   if (!pdesc)
>   return -EINVAL;
>  
> + pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
> +
>   prios = pdesc->prios;
>  
>   if (!prios)
> 

Moving Petr's review from previous version:

Reviewed-by: Petr Vorel <pvorel@suse.cz>

-Weiguo

