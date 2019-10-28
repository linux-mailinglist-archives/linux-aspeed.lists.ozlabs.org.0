Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F73CE7614
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Oct 2019 17:27:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4720W506x2zDrTk
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Oct 2019 03:27:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4720Vt51ynzDrTK;
 Tue, 29 Oct 2019 03:27:32 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 09:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="211478039"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 28 Oct 2019 09:27:29 -0700
Subject: Re: [PATCH] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
To: Navid Emamdoost <navid.emamdoost@gmail.com>
References: <20191026042519.29446-1-navid.emamdoost@gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
Date: Mon, 28 Oct 2019 09:27:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191026042519.29446-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, kjlu@umn.edu, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, emamd001@umn.edu, smccaman@umn.edu,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Navid,

On 10/25/2019 9:25 PM, Navid Emamdoost wrote:
> In the implementation of aspeed_video_probe() the allocated memory for
> video should be released in case of failure. Release video if either
> devm_ioremap_resource() or aspeed_video_init() or
> aspeed_video_setup_video() fails.
> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>   drivers/media/platform/aspeed-video.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb12f3793062..8c473356132d 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1663,18 +1663,24 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   
>   	video->base = devm_ioremap_resource(video->dev, res);
>   
> -	if (IS_ERR(video->base))
> -		return PTR_ERR(video->base);
> +	if (IS_ERR(video->base)) {
> +		rc = PTR_ERR(video->base);
> +		goto free_video;
> +	}
>   
>   	rc = aspeed_video_init(video);
>   	if (rc)
> -		return rc;
> +		goto free_video;
>   
>   	rc = aspeed_video_setup_video(video);
>   	if (rc)
> -		return rc;
> +		goto free_video;
>   
>   	return 0;
> +
> +free_video:
> +	kfree(video);
> +	return rc;
>   }
>   
>   static int aspeed_video_remove(struct platform_device *pdev)
> 

Can we simply change kzalloc in aspeed_video_probe with devm_kzalloc
so that we don't need to take care of freeing of video? I think it would
be more simpler.

Cheers,

Jae
