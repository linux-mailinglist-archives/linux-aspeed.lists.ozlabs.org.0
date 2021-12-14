Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E7347459E
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Dec 2021 15:53:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD1Zy4Pknz307L
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Dec 2021 01:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cF/VhgNg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=mchehab@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cF/VhgNg; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD1Zt6lMjz2yXv;
 Wed, 15 Dec 2021 01:53:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A63161545;
 Tue, 14 Dec 2021 14:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41196C34605;
 Tue, 14 Dec 2021 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639493585;
 bh=AzHNcyUA/QRvy9mrDm7aHrX+kNREOEaOReCfcbc2Xx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cF/VhgNgrjUoFOwS01/hdqyirsFFhGaSbDWxWEnel4pr35r2BE3+67wFlo0385QVN
 sg11RNm9ImM9CopIofbxt5YmJUEDE6s+TV+gxzdR3/J1lIBjEn+80OyZI8FjYQA7hT
 V/eFgALuGcKBUPY2hmCe9h2RRKT9bNMNMhHgBRHTLtmDJizrdhra/g7LvmTRMJgzGx
 Wr83hZUr5FLOQlRF8ScScaZVx4rfA6FkJoz+XZ1YugXijMDSCVovxxYoB10a8DryAj
 EefdXQTfGDZ3//3zus4/tACdXPwLr5UMj0BRBc/vWgBzwRstHWPdX+uhbj2AusjOYz
 W6rBfIELeqezQ==
Date: Tue, 14 Dec 2021 15:53:00 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2] media: aspeed: move err-handling together to the bottom
Message-ID: <20211214155300.0132946e@coco.lan>
In-Reply-To: <20211206004811.1118-1-jammy_huang@aspeedtech.com>
References: <20211206004811.1118-1-jammy_huang@aspeedtech.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Em Mon, 6 Dec 2021 08:48:11 +0800
Jammy Huang <jammy_huang@aspeedtech.com> escreveu:

> refine aspeed_video_setup_video() flow.

Why? It makes no difference where the error handling code is. Let's
keep it as preferred by the driver's author ;-)

Regards,
Mauro

> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> v2:
>  - remove change-id in comment
> ---
>  drivers/media/platform/aspeed-video.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index fea5e4d0927e..f5c40d6b4ece 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1641,11 +1641,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>  
>  	rc = video->ctrl_handler.error;
>  	if (rc) {
> -		v4l2_ctrl_handler_free(&video->ctrl_handler);
> -		v4l2_device_unregister(v4l2_dev);
> -
>  		dev_err(video->dev, "Failed to init controls: %d\n", rc);
> -		return rc;
> +		goto err_ctrl_init;
>  	}
>  
>  	v4l2_dev->ctrl_handler = &video->ctrl_handler;
> @@ -1663,11 +1660,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>  
>  	rc = vb2_queue_init(vbq);
>  	if (rc) {
> -		v4l2_ctrl_handler_free(&video->ctrl_handler);
> -		v4l2_device_unregister(v4l2_dev);
> -
>  		dev_err(video->dev, "Failed to init vb2 queue\n");
> -		return rc;
> +		goto err_vb2_init;
>  	}
>  
>  	vdev->queue = vbq;
> @@ -1685,15 +1679,19 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>  	video_set_drvdata(vdev, video);
>  	rc = video_register_device(vdev, VFL_TYPE_GRABBER, 0);
>  	if (rc) {
> -		vb2_queue_release(vbq);
> -		v4l2_ctrl_handler_free(&video->ctrl_handler);
> -		v4l2_device_unregister(v4l2_dev);
> -
>  		dev_err(video->dev, "Failed to register video device\n");
> -		return rc;
> +		goto err_video_reg;
>  	}
>  
>  	return 0;
> +
> +err_video_reg:
> +	vb2_queue_release(vbq);
> +err_vb2_init:
> +err_ctrl_init:
> +	v4l2_ctrl_handler_free(&video->ctrl_handler);
> +	v4l2_device_unregister(v4l2_dev);
> +	return rc;
>  }
>  
>  static int aspeed_video_init(struct aspeed_video *video)



Thanks,
Mauro
