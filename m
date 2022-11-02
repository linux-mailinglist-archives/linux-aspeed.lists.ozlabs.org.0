Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB606169F0
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 18:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Y8N1QJlz3cHl
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 04:01:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UU+RKF1n;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UU+RKF1n;
	dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Y8C56tWz2xks
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 04:01:45 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso20927914fac.13
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 10:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTbVmz53/9ndNpbNyEflArofYHtY/CLEQzDSDBCVaIw=;
        b=UU+RKF1npJ6jHhJr3wyiuVBxixm13WzkmATjigHpPQ6FAvZJ08Lvjv8ny9o0Ooy3A+
         fAGpt7NCIELo4/1yuEQ2ZpRBSiShmZM5WHVkF81zboOzZ1iuwPG4hG3MkAdi7W84MF8e
         D7F4AoSiUYRXKhOkH8gvFOKDe/P4NUrN9dccffON5jtMu1ZLfl1S6y+pUD13I5A/8zka
         U0IkdtQhp/EWrpexRncLN6FbYCX3R7PlRM46FyKkfvWY28X7qo8oTeRkUh7MGqkZ3D1T
         IbGQS896vfhCV5/23H68BpFH8bzoOdKaOtvH8yuj+6M43r9Ib9sm8Y36I3bYzYa93DDx
         /kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTbVmz53/9ndNpbNyEflArofYHtY/CLEQzDSDBCVaIw=;
        b=H+xs7a+VxB0ta3EyEn3zISAtz18WK3lbbRrEhUumsL3Y5Ux+vfXp0kLMA/aDC2m7s6
         llLjHOHxhR0VmQgo1kCpAg5ggjnOpYV9oi74VuCJE7RikC0Z1eEjb3KvPpOc9ZGFpSon
         KoqV2Kt8k8Fv7YzX1XQqwTCNduMhJLBAXNRUO/WzzHphKTQRwE2QbEEwdXenVa6v587b
         5TkuIBN3liINaYcRnuTlfvhsLxwCbxBrToazlaCU4VkjvB05PCKqj/gA9TLzH6xOysZv
         SzxxgdpKatMV0OUzt4dWbhdFWA+krtEoheqpo/MKyccKmvVhpyY8M0fa5cCsxOAGMqz9
         8bcQ==
X-Gm-Message-State: ACrzQf2g8PXcfWiKRqneuap2aRXZ9NlrTS54Ge+35akxCHgk0eJhspQX
	sp5r+dKWW5ljbnTq6aAV/9Y=
X-Google-Smtp-Source: AMsMyM6cTOnlcuU+5vJOzhM7A+6QFL8Nyw0vi1mOASlS3Nd62Qb6T56Po113hF2DT2jc+QGsR7HINQ==
X-Received: by 2002:a05:6870:608e:b0:12b:c0de:bc9d with SMTP id t14-20020a056870608e00b0012bc0debc9dmr15805718oae.52.1667408500796;
        Wed, 02 Nov 2022 10:01:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l19-20020a05687040d300b00127ebb410a4sm6275769oal.11.2022.11.02.10.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:01:40 -0700 (PDT)
Date: Wed, 2 Nov 2022 10:01:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 3/3] hwmon: Add Aspeed ast2600 TACH support
Message-ID: <20221102170138.GA2913353@roeck-us.net>
References: <20221101095156.30591-1-billy_tsai@aspeedtech.com>
 <20221101095156.30591-4-billy_tsai@aspeedtech.com>
 <20221101131456.GA1310110@roeck-us.net>
 <271C521D-8F20-4C86-B3DA-9C0AD74242D4@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <271C521D-8F20-4C86-B3DA-9C0AD74242D4@aspeedtech.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "garnermic@meta.com" <garnermic@meta.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 02, 2022 at 06:54:43AM +0000, Billy Tsai wrote:
> Hi Guenter,
> 
> On 2022/11/1, 9:15 PM, "Guenter Roeck" <groeck7@gmail.com on behalf of linux@roeck-us.net> wrote:
> 
>     On Tue, Nov 01, 2022 at 05:51:56PM +0800, Billy Tsai wrote:
>     > > +
>     > > +	/* Restart the Tach channel to guarantee the value is fresh */
>     > > +	aspeed_tach_ch_enable(priv, fan_tach_ch, false);
>     > > +	aspeed_tach_ch_enable(priv, fan_tach_ch, true);
> 
>     > Is that really needed ? Doesn't the controller measure values continuously ?
> 
> Yes, the controller will measure values continuously by hardware. I will remove it. 
> If the user want to get the fresh value, it should be done by the application layer
> (e.g. read two times).
> 
>     > > +
>     > > +	if (ret) {
>     > > +		/* return 0 if we didn't get an answer because of timeout*/
>     > > +		if (ret == -ETIMEDOUT)
>     > > +			return 0;
>     > > +		else
>     > > +			return ret;
> 
>     > else after return is unnecessary, and why would a timeout be be ignored ?
> 
> When the user sets the correct fan information (i.e., min_rpm, max_rpm), the read
> poll timeout will only occur if the tach pin does not get any signal (i.e. rpm=0).
> 

In that case it would be appropriate to return -ETIMEDOUT to the caller.

Anyway, that should really not happen. Sysfs attributes such as minimum/maximum fan
speed, the number of fan pulses per revolution, or a divider value should only exist
if the chip needs that information, for example to report a fan error/alarm if the
measured speed is out of range or if the chip actually calculates RPM and provides
the result to the driver. Those values should not be necessary (and should not be
used) to calculate some timeout.

>     > > +	}
>     > > +
>     > > +	raw_data = val & TACH_ASPEED_VALUE_MASK;
>     > > +	/*
>     > > +	 * We need the mode to determine if the raw_data is double (from
>     > > +	 * counting both edges).
>     > > +	 */
>     > > +	if (priv->tach_channel[fan_tach_ch].tach_edge == BOTH_EDGES)
>     > > +		raw_data <<= 1;
>     > > +
>     > > +	tach_div = raw_data * (priv->tach_channel[fan_tach_ch].divisor) *
>     > > +		   (priv->tach_channel[fan_tach_ch].pulse_pr);
>     > > +
>     > > +	clk_source = clk_get_rate(priv->clk);
>     > > +	dev_dbg(priv->dev, "clk %ld, raw_data %d , tach_div %d\n", clk_source,
>     > > +		raw_data, tach_div);
>     > > +
>     > > +	if (tach_div == 0)
>     > > +		return -EDOM;
> 
>     > If the fan is off or not connected, would that return an error ?
>     > If so, that would be inappropriate; it should return a speed
>     > of 0 in that case.
> 
> It will be handled by the regmap_read_poll_timeout.

This would only happen if raw_data is 0, or if any of
priv->tach_channel[fan_tach_ch].divisor or priv->tach_channel[fan_tach_ch].pulse_pr
are 0. The latter should never happen, leaving raw_data. If that is 0, I would assume
that there was no fan pulse. That would indicate that the fan isn't running (or maybe
that no fan is connected). Either case that would not warrant returning -EDOM.
If the fan isn't running (no pulse was reported), the reported fan speed should be 0.
If that is an error, the fanX_alarm (or, if available, fanX_min_alarm) should report 1.
Reading the fan speed should never return an error to the caller unless there was
an actual error when reading the value from the hardware.

Thanks,
Guenter
