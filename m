Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885994AEA4F
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 07:30:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtqjy1Wf9z3bPS
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 17:29:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
X-Greylist: delayed 380 seconds by postgrey-1.36 at boromir;
 Wed, 09 Feb 2022 17:29:54 AEDT
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtqjt1Sg6z2yPL
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 17:29:53 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aee30.dynamic.kabel-deutschland.de
 [95.90.238.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id A85D361E64846;
 Wed,  9 Feb 2022 07:23:21 +0100 (CET)
Message-ID: <554448a9-bc65-7c0b-9878-fb2c0fe9bfe4@molgen.mpg.de>
Date: Wed, 9 Feb 2022 07:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1] media: aspeed: Fix incorrect color
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20220209024312.2218-1-jammy_huang@aspeedtech.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220209024312.2218-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Dear Jammy,


Am 09.02.22 um 03:43 schrieb Jammy Huang:
> Current settings for rgb-2-yuv is BT.601(studio swing), but JFIF
> uses BT.601(full swing).

Could you please describe the problem in a little more detail? On an 
attached monitor to the BMC (which one) what incorrect colors are seen?

Maybe use:

> media: aspeed: Use full swing for JFIF to fix incorrect color

> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed-video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb9c17ac0e14..08b63b8297f0 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1089,7 +1089,7 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>   	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
>   		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>   		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> -	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
> +	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR | VE_CTRL_YUV;

Excuse my ignorance, but reading [1][2] YUV can be represented by studio 
and full swing. How is the register/bit described in the datasheet, and 
can the macro name be improved?

>   	u32 seq_ctrl = video->jpeg_mode;
>   
>   	if (video->frame_rate)


Kind regards,

Paul


[1]: https://mymusing.co/bt601-yuv-to-rgb-conversion-color/
[2]: https://www.hisour.com/yuv-color-system-25916/
