Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057504E72A0
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:00:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ0yn69M1z306D
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:00:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=hsiangkao@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 318 seconds by postgrey-1.36 at boromir;
 Fri, 25 Mar 2022 15:39:31 AEDT
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPqBC0FWtz2xtp
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 15:39:28 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=15; SR=0; TI=SMTPD_---0V87hnAX_1648182834; 
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V87hnAX_1648182834) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 12:33:56 +0800
Date: Fri, 25 Mar 2022 12:33:53 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/3] Documentation/ABI: sysfs-fs-erofs: Fix Sphinx errors
Message-ID: <Yj1GMaQN/W+kpT6e@B-P7TQMD6M-0146.local>
References: <20220324165918.22005-1-hdegoede@redhat.com>
 <20220324165918.22005-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220324165918.22005-4-hdegoede@redhat.com>
X-Mailman-Approved-At: Fri, 25 Mar 2022 23:00:04 +1100
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Amit Kucheria <amitk@kernel.org>,
 linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Huang Jianan <huangjianan@oppo.com>, linux-pm@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 24, 2022 at 05:59:18PM +0100, Hans de Goede wrote:
> Fix the following warnings from "make htmldocs":
> 
> Documentation/ABI/testing/sysfs-fs-erofs:10:
>   ERROR: Unexpected indentation.
>   WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks!

Acked-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  Documentation/ABI/testing/sysfs-fs-erofs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-erofs b/Documentation/ABI/testing/sysfs-fs-erofs
> index 05482374a741..bb4681a01811 100644
> --- a/Documentation/ABI/testing/sysfs-fs-erofs
> +++ b/Documentation/ABI/testing/sysfs-fs-erofs
> @@ -9,8 +9,9 @@ Description:	Shows all enabled kernel features.
>  What:		/sys/fs/erofs/<disk>/sync_decompress
>  Date:		November 2021
>  Contact:	"Huang Jianan" <huangjianan@oppo.com>
> -Description:	Control strategy of sync decompression
> +Description:	Control strategy of sync decompression:
> +
>  		- 0 (default, auto): enable for readpage, and enable for
> -				     readahead on atomic contexts only,
> +		  readahead on atomic contexts only.
>  		- 1 (force on): enable for readpage and readahead.
>  		- 2 (force off): disable for all situations.
> -- 
> 2.35.1
