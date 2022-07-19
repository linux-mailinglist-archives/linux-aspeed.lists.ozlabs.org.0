Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A9578FF1
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 03:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln1lv47vDz3bqT
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 11:42:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J1Br5IYc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=davidgow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J1Br5IYc;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ln1lm0pkjz2yT0
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Jul 2022 11:41:54 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id h17so19561781wrx.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Jul 2022 18:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LxFTH0qHZKLhTD/kmSFBNFMbbUAZPXI4JPLHcPMNBMs=;
        b=J1Br5IYcbwIVKYQXgy/QYGzfCwp0tn+sp7PLYfGFJ5ko3la77vXDzqiHEk+YGpMIsl
         HVQuokivZP2qJ816sIIs0HU5VFu/q36jeDVZCV4b6NBRAa22xECobAYAtv9Dh/DtWkJd
         2QvuxhQ93BuqOCVWCYGnwQ8KSuAzZ9cFCaGZOwtmnD/SGw4BpF3ORASfJNzFcGS1+xg+
         8dWyaCExHtydhXmQE/EQQVT+zJJvHGwVe1YJ6eBBxtxYuK4809qopkOgJHF40i4Pr6Sx
         HXiTXxfvyZaAjKu0+XKqWQM0PHfuw/xJKrCVUReycAav6N4BckvPYBF+IfEOD2AJjmuC
         eu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LxFTH0qHZKLhTD/kmSFBNFMbbUAZPXI4JPLHcPMNBMs=;
        b=gELtoem4EwKlZNIiJRh7LYovT7bxBvrcgYajRJm3BrfhdQktLfKBgUVkXEcMNhtcLU
         t+jyJ7mVnVr+A3MZOzEagAspsQEaYFg6fBjoS9sfq35Rp5DfII1a7UR2tu1MgWYuB369
         wyqv4WC1or0MWafspRUZp9JfnSctPMCpuCNixkYUfGz1AHgspHKQGCIyHqbrL5cOY1q+
         qBug5Uq4GdO7mXEVleBUviV7ZeDxWWqhF8vYNb0yZdUIHv76Pg2lu0Vvf/wFk+cNmjQp
         Vx6UI9kbFL34QYMTQg0wfyhV117cJQGFV27VwWZueV9DRlS3m1fKaYPQRCx5NDKhtRl3
         t75A==
X-Gm-Message-State: AJIora+krMrDpHriqc/zVBUfQLbavtqDjg/K56NlzTKuw6JLEBN9fg5L
	ZlFqQTSQGX+z28L6u05lhUl+ulkNnPRWawWxmu96XQ==
X-Google-Smtp-Source: AGRyM1sFBg4zKz4vRUarom3Dl7jIunk18ZUIQ2JBDUoRioOTSf4z9Hog3fUA+UuM/YpxwhbZ5Y3AYJmmVcVphC2eGVM=
X-Received: by 2002:adf:ed12:0:b0:21e:2ded:6f52 with SMTP id
 a18-20020adfed12000000b0021e2ded6f52mr1370516wro.517.1658194908202; Mon, 18
 Jul 2022 18:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220715040354.2629856-1-davidgow@google.com> <38480b33-3b4d-44d4-bb24-6ab199d0c793@www.fastmail.com>
In-Reply-To: <38480b33-3b4d-44d4-bb24-6ab199d0c793@www.fastmail.com>
From: David Gow <davidgow@google.com>
Date: Tue, 19 Jul 2022 09:41:37 +0800
Message-ID: <CABVgOSnhKMKc0_LvHVYPzL5NVnEuL51nQSm+8bZbjO=Q4seYiw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: test: Fix dependencies when KUNIT=m
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007d47ef05e41e96a7"
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-mmc <linux-mmc@vger.kernel.org>, Daniel Latypov <dlatypov@google.com>, Brendan Higgins <brendanhiggins@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Sadiya Kazi <sadiyakazi@google.com>, KUnit Development <kunit-dev@googlegroups.com>, kbuild test robot <lkp@intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--0000000000007d47ef05e41e96a7
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 8:45 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 15 Jul 2022, at 13:33, David Gow wrote:
> > While the sdhci-of-aspeed KUnit tests do work when builtin, and do work
> > when KUnit itself is being built as a module, the two together break.
> >
> > This is because the KUnit tests (understandably) depend on KUnit, so a
> > built-in test cannot build if KUnit is a module.
> >
> > Fix this by adding a dependency on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y),
> > which only excludes this one problematic configuration.
> >
> > This was reported on a nasty openrisc-randconfig run by the kernel test
> > robot, though for some reason (compiler optimisations removing the test
> > code?) I wasn't able to reproduce it locally on x86:
> > https://lore.kernel.org/linux-mm/202207140122.fzhlf60k-lkp@intel.com/T/
> >
> > Fixes: 291cd54e5b05 ("mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: David Gow <davidgow@google.com>
> > ---
> >  drivers/mmc/host/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> > index 10c563999d3d..e63608834411 100644
> > --- a/drivers/mmc/host/Kconfig
> > +++ b/drivers/mmc/host/Kconfig
> > @@ -171,6 +171,7 @@ config MMC_SDHCI_OF_ASPEED
> >  config MMC_SDHCI_OF_ASPEED_TEST
> >       bool "Tests for the ASPEED SDHCI driver" if !KUNIT_ALL_TESTS
> >       depends on MMC_SDHCI_OF_ASPEED && KUNIT
> > +     depends on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y)
>
> Should this replace the line above? Isn't it just more constrained?
>

We need both lines. The first ensures that both KUNIT and
MMC_SDHCI_OF_ASPEED are available, and the second just targets the
case where KUNIT=m and MMC_SDHCI_OF_ASPEED=y.
If we got rid of the first line, we could end up compiling this
without KUnit at all (if MMC_SDHCI_OF_ASPEED=m).

> Regardless, thanks for your work here, the kunit integration with the
> ASPEED SDHCI driver bothered me a lot when I wrote it.

No worries: we're all still figuring out exactly how these sorts of
tests should interact with modules, so it's been a great real-world
example for us to experiment with.

Cheers,
-- David

--0000000000007d47ef05e41e96a7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
z/tQRXr3iPeVmZCr7nttMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAx+EQjLATc/sze
VoZkH7OLz+/no1+y31x4BQ3wjW7lKfay9DAAVym896b7ECttSo95GEvS7pYMikzud57WypK7Bjpi
ep8YLarLRDrvyyvBuYtyDrIewkuASHtV1oy5E6QZZe2VOxMm6e2oJnFFjbflot4A08D3SwqDwV0i
OOYwT0BUtHYR/3903Dmdx5Alq+NDvUHDjozgo0f6oIkwDXT3yBV36utQ/jFisd36C8RD5mM+NFpu
3aqLXARRbKtxw29ErCwulof2dcAonG7cd5j+gmS84sLhKU+BhL1OQVXnJ5tj7xZ5Ri5I23brcwk0
lk/gWqfgs3ppT9Xk7zVit9q8MYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCAP
xlac0XklBJzFE10BsnaUbD4WEKGOA2/exiWVevS0uDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA3MTkwMTQxNDhaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEABBSg6FVt0kFXhOiKfMmb
cPkigARBA4iie+A9SXbAihn5DovF1EHfSINgOj6ApNDgCm8xM+YW4QL5w1ThYgNwxH4X/VxwxwIl
Ld9zH7fo5aJvrGM2I0JNs5qC5sRed9grrjy527WsFyzJ4ahpqEvmvQYPuGuURFd2C9EXJHMTfv4B
EClnZCSXSQjJZGd7AALoJJ5LVv9u4ReAvlqgKOVGB5MVijZuaNKRuIvzHWagmiY5DWZkXhCdERq4
QRb+J6ubKdHQEJxMfTf6q/xq3abxQAx+nFhZohzLoSULlVSXNghc2UYC0Jri+xV8Sdis2aYd4xsf
3Uw0GKNmHCeSab0CjQ==
--0000000000007d47ef05e41e96a7--
