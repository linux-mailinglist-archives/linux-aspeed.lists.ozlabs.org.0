Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722C551459
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 11:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRPVg0r9Dz3bs0
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 19:29:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=DJ+WMLVy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=DJ+WMLVy;
	dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRPTt4zVdz302N
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Jun 2022 19:28:49 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id q1-20020a056830018100b0060c2bfb668eso7935040ota.8
        for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Jun 2022 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+E3s3QkzcGFpv21zvwpnb65PL/N10eRE8HHqyGPUlDc=;
        b=DJ+WMLVyMwk8maVS9kj+U87ierbJivmOILpqH3I4hGvoc2Z9YfIw2VmzeT+Uuheqxv
         nPvWVaQSB3YN4TTTiQWhxCQuuYcir5Ex60T9T7HKonhAYy41SC93O31KDnNVe31cciL4
         AAxR6NsWDL6VfIlvS1pVm9ii3WUK3k4wRcVRjtokGdyVty9/xnQip4De6UptgBNIBp07
         3VvCIrKKP5X4gV5gW2SwoXawpX5TzEBTLQtmtbIZhaekKODLM/mMoMessleLAVEg1V33
         rHbkx+ZruDcbZGT06xaIMQuIMrszKhbGykUyEIUhEgEQaTjHd4ckIY4GJpuDdYeA3Mw2
         6oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+E3s3QkzcGFpv21zvwpnb65PL/N10eRE8HHqyGPUlDc=;
        b=iFFvG4wzKBWuhu/73bKTZTxlajFRR0W+H6GFnZhfRvry1W/fMf7CJFL7vFfsCour/5
         RasT74+YpPaXxGaeRkX9CHowQ22khJv6zDcM/omkEWmnmUtO3QbFHbENLVbd9E+tX3W+
         wDjBnCyGP/zRjwTSW69dX5QsW8x1wynRpPOMpsXf2bAdEimlDrdvtizz6kAqrKeddBMO
         PmdvmNdCbSxVj7kO8R0ZnTc0iL7AkjYp45B2WMj0ljObghfkBvYv9hSmtr2Ss+MOyeoI
         CG0db5QyoyNyrmR64Pb1z6RTKW8Jxmo55rP/SLi/okqJGNjsr6GfqLT1jxyB3DT6CHBt
         tpgg==
X-Gm-Message-State: AJIora//b3xn6TUz6+PJIHPZbVqX26/RFnbIBZ8akRnYV/G+376IB5JP
	HwIwVrAhZM19ifzxiKJ1+ixcVyp5/J8gdN4IaPtcXg==
X-Google-Smtp-Source: AGRyM1u7wtq73sNYXuB85ckFWHp/sUaPQojdzAh+InCrMmV7DdteUrkzZjnIv3HX4ij2uk7XcCZ6MyDeHlvDKFC0AzA=
X-Received: by 2002:a05:6830:2b23:b0:60e:3067:e496 with SMTP id
 l35-20020a0568302b2300b0060e3067e496mr8585268otv.16.1655717325999; Mon, 20
 Jun 2022 02:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220126014725.1511-1-jammy_huang@aspeedtech.com> <20220126014725.1511-3-jammy_huang@aspeedtech.com>
In-Reply-To: <20220126014725.1511-3-jammy_huang@aspeedtech.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 20 Jun 2022 17:28:34 +0800
Message-ID: <CAGm54UHobZ7f9q7vB5F8fJDeyr_PSbRxJPg45etscxxSvRtFVA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: aspeed: Fix unstable timing detection
To: Jammy Huang <jammy_huang@aspeedtech.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, openbmc <openbmc@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

We hit an issue where the resolution is not detected correctly.
The issue could be fixed by this patch.

Tested-by: Lei YU <yulei.sh@bytedance.com>

On Wed, Jan 26, 2022 at 9:49 AM Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>
> Using stable-signal in resolution detection, and try detection again
> if unstable.
>
> VE_MODE_DETECT_EXTSRC_ADC: 1 if video source is from ADC output.
> VE_MODE_DETECT_H_STABLE: 1 if horizontal signal detection is stable.
> VE_MODE_DETECT_V_STABLE: 1 if vertical signal detection is stable.
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 5d1ec3de50ad..eb9c17ac0e14 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -153,9 +153,14 @@
>
>  #define VE_MODE_DETECT_STATUS          0x098
>  #define  VE_MODE_DETECT_H_PERIOD       GENMASK(11, 0)
> +#define  VE_MODE_DETECT_EXTSRC_ADC     BIT(12)
> +#define  VE_MODE_DETECT_H_STABLE       BIT(13)
> +#define  VE_MODE_DETECT_V_STABLE       BIT(14)
>  #define  VE_MODE_DETECT_V_LINES                GENMASK(27, 16)
>  #define  VE_MODE_DETECT_STATUS_VSYNC   BIT(28)
>  #define  VE_MODE_DETECT_STATUS_HSYNC   BIT(29)
> +#define  VE_MODE_DETECT_VSYNC_RDY      BIT(30)
> +#define  VE_MODE_DETECT_HSYNC_RDY      BIT(31)
>
>  #define VE_SYNC_STATUS                 0x09c
>  #define  VE_SYNC_STATUS_HSYNC          GENMASK(11, 0)
> @@ -909,6 +914,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>         bool invalid_resolution = true;
>         int rc;
>         int tries = 0;
> +       u32 mds;
>         u32 src_lr_edge;
>         u32 src_tb_edge;
>         struct v4l2_bt_timings *det = &video->detected_timings;
> @@ -939,6 +945,13 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                         return;
>                 }
>
> +               mds = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
> +               // try detection again if current signal isn't stable
> +               if (!(mds & VE_MODE_DETECT_H_STABLE) ||
> +                   !(mds & VE_MODE_DETECT_V_STABLE) ||
> +                   (mds & VE_MODE_DETECT_EXTSRC_ADC))
> +                       continue;
> +
>                 aspeed_video_check_and_set_polarity(video);
>
>                 aspeed_video_enable_mode_detect(video);
> --
> 2.25.1
>


-- 
BRs,
Lei YU
