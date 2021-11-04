Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0A2445BF8
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 23:04:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hld2T6Z6Bz2yQw
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 09:04:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PWKl2kBL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PWKl2kBL; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hld2M5Cvqz2xY9
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 09:03:53 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id d21so5546530qtw.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KNYXs3xofIWr/n4uvu7HATHQ9F6yoONlFhMGAxuRQ3I=;
 b=PWKl2kBL5Tl29ZxXsl9mUoreSxvUbe+atVYc8CmRBrgQnKhwaWZokyaqUdC/EkEPeM
 8r84XNBPuNEcfdwzE4G4Q/HDRj5QgyY6qnnlFnN+QWlZQ8ts3CJ0B2zSqEF+AouFe1XR
 slCcxgMKvlKo7H7vwjlsY03mKqlwcqbgLNyUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KNYXs3xofIWr/n4uvu7HATHQ9F6yoONlFhMGAxuRQ3I=;
 b=zpLZL8yqGBk4OsWFDfhlD+Xk3D2qLga6eNjqlZyZzPfsqyuWnGARFh0JuLVZcGboqx
 BtbDV0Y/xG6GgqjqHEXfEMrnX8mQ+W/Wv7Lklrl6aVbuCEyLgBig4d3GYlpsKEmMGI1d
 WcVfi42oMZBjxL8EoeVFC3rRLPLfmzij6Popoeserw5lZstwh405yGgWAATNTkj019AE
 52ABq67pbi68fwm9M/Q4UUMBBZDuT2YUmMVdHpK3QPnafM/z+Lc0NpyjdQL6Qrbf/h3P
 ie4g1ndxXZ+LTq17mk6DxjaHWJanNwIvjXlfMwwklFd5wF9jFXJlvOEOqHZ6b0+mROqK
 aPUQ==
X-Gm-Message-State: AOAM531kmFKG5JBXb5jBR6GsW4LTVenxH0jSEerX/kXElkUPDkPD8DBJ
 q+9XZUjPjYI7yv8IzA/cmV30vVeE7Ms3nesE7Uk=
X-Google-Smtp-Source: ABdhPJxJvYt5Sl8+H/gw91CKZ4Snqr35ZHf2GBtcwpS+mvMXqZaezIcTEFCeNYsnXrh/fVaVupCJcPkrLo8gmd1MWeA=
X-Received: by 2002:a05:622a:1450:: with SMTP id
 v16mr46628365qtx.25.1636063429981; 
 Thu, 04 Nov 2021 15:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211104210914.4160448-1-osk@google.com>
In-Reply-To: <20211104210914.4160448-1-osk@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Nov 2021 22:03:37 +0000
Message-ID: <CACPK8XfXuU4i4khbpo8rxqxT9zz021N_m=s8uinoT+nHbCa_Yg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
To: Oskar Senft <osk@google.com>
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
Cc: Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 4 Nov 2021 at 21:09, Oskar Senft <osk@google.com> wrote:
>
> This change updates the configuration for the nct7802 hardware
> monitor to correctly configure its temperature sensors.
>
> Signed-off-by: Oskar Senft <osk@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> index 68f332ee1886..fc1585f34a57 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> @@ -213,6 +213,29 @@ &i2c0 {
>         nct7802@28 {
>                 compatible = "nuvoton,nct7802";
>                 reg = <0x28>;
> +               channel@0 { /* LTD */
> +                       reg = <0>;
> +                       status = "okay";

The status = "okay" should be redundant; as long as  you don't specify
a status, a node is assumed to be enabled.

> +               };
> +               channel@1 { /* RTD1 */
> +                       reg = <1>;
> +                       status = "okay";
> +                       sensor-type = "temperature";
> +                       temperature-mode = "thermistor";
> +               };
> +
> +               channel@2 { /* RTD2 */
> +                       reg = <2>;
> +                       status = "okay";
> +                       sensor-type = "temperature";
> +                       temperature-mode = "thermistor";
> +               };
> +
> +               channel@3 { /* RTD3 */
> +                       reg = <3>;
> +                       status = "okay";
> +                       sensor-type = "temperature";
> +               };
>         };
>
>         /* Also connected to:
> --
> 2.34.0.rc0.344.g81b53c2807-goog
>
